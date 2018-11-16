# load library needed for human-readable strings
source /servers/harbinger/harbinger/deployment/td.sh

# get epoch time
START=$(date +%s)

# get ISO 8601 timestamp
timestamp() { date +%FT%T%z; }

# calculate duration between two timestamps as human-readable string
duration() {
    end=$(date +%s)
    diff=$(echo "$end - $START" | bc)
    print_td $diff
}

# get value from key in local db configuration_variables
get_config() { psql -A -t -U harbinger -c "select configuration_value from configuration_variables where configuration_key='$1';"; }

# insert-or-update key/value into local db configuration_variables
set_config() {
    ret=$(psql -U harbinger -c "update configuration_variables set configuration_value='$2', updated_at=now() where configuration_key='$1';")
    if [ "$ret" == "UPDATE 0" ]; then
	psql -U harbinger -c "insert into configuration_variables (configuration_key,configuration_value,updated_at) values ('$1','$2',now());"
    fi
}

# default site.config.json
SITECONFIGJSON="/servers/harbinger/config/site.config.json"

# extract site configuration value from key pair
get_siteconfig() {
    echo $(python -c 'import sys, json; print json.load(open(sys.argv[1])).get(sys.argv[2],{}).get(sys.argv[3])' $SITECONFIGJSON $1 $2)
}

# get database commit from local db configuration_variables value
current_db() { get_config "data-model-commit-id"; }

# get hash of last commit to submodule, regardless of current state (e.g. saved not now)
get_git_commit() { git ls-tree --full-tree HEAD -- $1 | awk "{ print \$3; }"; }

# get tag of current submodule, regardless of commit state (e.g. now not saved)
get_current_tag() {
    # only works with git >1.7
    #ugly_tag=$(git submodule status | grep $1 | awk "{ print \$3; }")
    #ugly_tag=${ugly_tag#(}
    #ugly_tag=${ugly_tag#v}
    #echo ${ugly_tag%)}

    # should work on git >= 1.7
    cd /servers/harbinger/harbinger/$1
    echo $(git describe)
}

# get hash of current submodule, regardless of commit state (e.g. now not saved)
get_current_commit() {
    # only works with git >1.7
    #raw_commit=$(git submodule status | grep $1 | awk "{ print \$1; }")
    #echo ${raw_commit#+}

    # should work on git >= 1.7
    cd /servers/harbinger/harbinger/$1
    echo $(git log --format="%H" -1)
}

# get full path to script
SCRIPTNAME=`basename $0`

# log file from /servers/harbinger/config/site.config.json
LOGFILE="$(python -c 'import sys, json; print json.load(open(sys.argv[1]))[sys.argv[2]][sys.argv[3]]' /servers/harbinger/config/site.config.json local-paths logging-dir)/bridge-service.log"

# harbinger db password from /servers/harbinger/config/site.config.json
HARBINGER_PW="$(python -c 'import sys, json; print json.load(open(sys.argv[1]))[sys.argv[2]][sys.argv[3]]' /servers/harbinger/config/site.config.json harbinger-rw password)"

# start logging (run at the start of all scripts)
start_log() { echo "$(timestamp) $(whoami) started $SCRIPTNAME" >> $LOGFILE; }

# stop logging (run at the end of all scripts)
end_log() { echo "$(timestamp) $(whoami) finished $SCRIPTNAME in $(duration)" >> $LOGFILE; }
