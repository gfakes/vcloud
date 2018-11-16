/*
 *
 * $Id: cnagios.h.in,v 1.64 2011/03/08 12:37:41 rader Exp $
 *
 */ 
 
/*----------------------------------------*/

#define POLLING_INTERVAL  	90

#define SWIPE_DELAY	  	50000   /* screen redraw */
#define SHORT_MSG_DELAY	  	150000	/* interactive commands */
#define LONG_MSG_DELAY		300000	/* filter deleted, key filters */
#define ERROR_MSG_DELAY		600000	/* entry syntax error */

#define NAGIOS_VERSION		 3
#define STATUS_FILE	  	"/var/cache/nagios3/status.dat"
#define STATUS_DAT_FILE	  	"/var/cache/nagios3/status.dat"
#define PERL_HOOK_FILE		"/etc/nagios3/cnagios.pl"
#define HELP_FILE     	  	"/etc/nagios3/cnagios.help"
#define CONFIG_FILE	  	"/etc/nagios3/cnagiosrc"
#define DOT_CONFIG_FILE 	".cnagiosrc"

#define MAX_ITEMS		10000
#define MAX_PATH_LENGTH         1024
#define MAX_CHARS_PER_LINE      1024
#define STRING_LENGTH           1024
#define MAX_TERM_WIDTH          1024
#define MAX_STATUS_TYPE_LEN     8

/*----------------------------------------*/

#define HOST_OBJECTS		 0
#define SERVICE_OBJECTS 	 1

#define UP             		 0
#define DOWN            	 2
#define OKAY			 0
#define UNKNOWN			 1
#define WARNING			 1
#define PENDING            	 1
#define CRITICAL 		 2

#define SORT_BY_NAME		 0
#define SORT_BY_AGE		 1

#define NO_FILTER		 0
#define FILTER_BY_NAME		 1
#define FILTER_BY_NOT_NAME	 2
#define FILTER_BY_AGE		 4
#define FILTER_BY_AGE_OKAY	 8 

#define FILTER_BY_NAME_BIT	 0
#define FILTER_BY_NOT_NAME_BIT	 1
#define FILTER_BY_AGE_BIT	 2
#define FILTER_BY_AGE_OKAY_BIT   3 

#define NUM_HOST_ENTRY_ATTRS    20
#define NUM_SERVICE_ENTRY_ATTRS 31
#define STATUS_LIST_ENTRY_SIZE   8
                                     /*  HOST  SERVICE   */
#define LAST_UPDATE		 0   /*	    0	     0   */
#define HOST_NAME		 1   /*     1	     1   */
#define SERVICE_NAME		 2   /*    na	     2   */
#define STATUS		 	 3   /*	    2	     3   */
#define LAST_STATE_CHANGE_INT	 4   /*     4       12   */
#define LAST_STATE_CHANGE	 5   /*     4       12   */
#define DURATION		 6   /*     4       12   */
#define PLUGIN_OUTPUT		 7   /*    20       31   */

#define HOST_PLUGIN_HOOK	0
#define SERVICE_PLUGIN_HOOK	1

/*----------------------------------------*/
/* from v2 include/nagios.h...        */

#define NAGIOS_HOST_UP                         '0'
#define NAGIOS_HOST_DOWN                       '1'
#define NAGIOS_HOST_UNREACHABLE                '2'
#define NAGIOS_STATE_OK                        '0'
#define NAGIOS_STATE_WARNING                   '1'
#define NAGIOS_STATE_CRITICAL                  '2'
#define NAGIOS_STATE_UNKNOWN                   '3'

/*----------------------------------------*/

#define HEADER_PAD	 2
#define PAD		 1

/* excludes PAD which can be cli arg... */
#define HEADER_SIZE 	 6
#define TITLE_SUFFIX 	 "Cnagios"
#define HEAD1_BEGIN      "Status   "
#define HEAD2_BEGIN      "-------- "
#define LINE_BEGIN_SPEC  "%-8.8s "
#define LINE_BEGIN_LEN   9 
#define HEAD_MIDDLE_LHS  "Description"
#define HEAD_MIDDLE_RHS  "Plugin Output"
#define HEAD1_END        "   Last Change     Duration"
#define HEAD2_END        " ----------------  --------"
#define LINE_END_SPEC    " %16.16s  %8.8s"
#define LINE_END_LEN     27
/* excludes PAD which can be cli arg... */
#define FOOTER_SIZE      3

#define CENTERING_FUDGE  -2

/*----------------------------------------*/

#define GREEN_ON_BLACK 	 1
#define YELLOW_ON_BLACK  2
#define RED_ON_BLACK 	 3
#define CYAN_ON_BLACK 	 4

#define DEFAULT_COLOR    CYAN_ON_BLACK

/*----------------------------------------*/

#define BIT_SET(x,y) ((y >> x) % 2)

/*----------------------------------------*/

struct obj_by_age {
  int index;
  int age;
  int level;
  struct obj_by_age *next;
};

/*----------------------------------------*/

struct seen_item {
  int index;
  int level;
  struct seen_item *next;
};

void add_seen_item(int);
char *calc_duration();
int convert_level(char *);
void draw_screen();
int filter_doesnt_match(char *, char *);
int filter_matches(char *, char *);
void getch_loop();
void help();
int parse_age_filter(char *,int);
void perl_hook(int, char *);
void perl_hook_init();
void perl_hook_free();
int perl_regex_hook(char *,char *,int);
void read_dot_files();
void read_status();
void read_v1_status();
void read_v23_status();

