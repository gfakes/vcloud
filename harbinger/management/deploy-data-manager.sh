#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
start_log
DM_TAG=$(get_current_tag "data-manager")
echo "Current data-manager-version: $(get_config "data-manager-version")" >> $LOGFILE
echo '================================================================================' | tee -a $LOGFILE
echo 'Deploying Data Manager...' | tee -a $LOGFILE
echo '================================================================================' | tee -a $LOGFILE
sudo cp -vf --remove-destination /servers/harbinger/config/data_manager.config /etc/data_manager.config | tee -a $LOGFILE
cd /servers/harbinger/harbinger/data-manager
./deploy-local.sh
set_config "data-manager-version" $DM_TAG
read -p "Would you like to start data-manager? (yN)  "
[[ $REPLY = [yY] ]] && sudo service data_manager start || echo "Data-manager was not started."
echo '================================================================================' | tee -a $LOGFILE
echo 'Done.' | tee -a $LOGFILE
echo '================================================================================' | tee -a $LOGFILE
echo "Current data-manager-version: $(get_config "data-manager-version")" >> $LOGFILE
end_log
