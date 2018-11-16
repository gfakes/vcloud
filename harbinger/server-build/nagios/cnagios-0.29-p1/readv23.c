/* 
 *  $Id: readv23.c,v 1.32 2011/03/28 15:45:38 rader Exp $
 */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <time.h>
#include <curses.h>
#include "cnagios.h"

/*------------------------------------------------------------------*/

extern int host_list_size;
extern char *host_list[MAX_ITEMS][STATUS_LIST_ENTRY_SIZE];
extern struct obj_by_age *hosts_by_age;
extern int host_idx_to_level[MAX_ITEMS];
extern int service_list_size;
extern char *service_list[MAX_ITEMS][STATUS_LIST_ENTRY_SIZE];
extern struct obj_by_age *services_by_age;
extern int service_idx_to_level[MAX_ITEMS];
extern int num_up, num_down;
extern int num_okay, num_warn, num_crit;
extern char last_update[21];
extern int last_update_int;

extern int object_mode;
extern int sort_mode;
extern int pad;
extern int color;

/*------------------------------------------------------------------*/

struct status_dot_dat_entry {
 char *lhs;
 char *rhs;
};

void parse_entry(struct status_dot_dat_entry *, char *);

/*------------------------------------------------------------------*/

void
read_v23_status()
{
  FILE *fp;
  char buffer[MAX_CHARS_PER_LINE];
  struct status_dot_dat_entry ent;
  int i;
  int stamp;
  time_t new_time = 0;

#ifdef _DEBUG_
debug("read_v23_status()...");
debug("status file is %s",STATUS_DAT_FILE);
debug("status file format is version %d",NAGIOS_VERSION);
#endif

  /*--------------------------------------------------------*/
  mvaddstr(LINES-1-pad,pad,"reading status.dat...");
  refresh();

  /*--------------------------------------------------------*/
  if ((fp = fopen(STATUS_DAT_FILE, "r")) == NULL) {
    endwin();
    fprintf(stderr,"fatal error: fopen %s ",STATUS_DAT_FILE);
    perror("failed");
    exit(1);
  }

  /*--------------------------------------------------------*/
  /* read last update */
  fgets(buffer,sizeof(buffer),fp);
  while (buffer[0] == '#') { 
    fgets(buffer,sizeof(buffer),fp);
  }
  fgets(buffer,sizeof(buffer),fp);
  if ( strcmp(buffer,"info {\n") != 0 ) {
    endwin();
    printf("fatal error: could not parse last update from %s\n", STATUS_DAT_FILE);
    exit(1);
  }
  fgets(buffer,sizeof(buffer),fp);
  parse_entry(&ent,buffer);
  if ( !strcmp(ent.lhs,"created") ) {
    last_update_int = atoi(ent.rhs);
    new_time = last_update_int;
    strncpy(last_update,ctime(&new_time),20);
    last_update[21] = '\0';
  } else {
    endwin();
    printf("fatal error: could not parse last update from %s\n", STATUS_DAT_FILE);
    exit(1);
  }
#ifdef _DEBUG_
debug("last update was %s (%d)",last_update,last_update_int);
#endif

  /*--------------------------------------------------------*/
  num_okay = num_warn = num_crit = 0;
  host_list_size = service_list_size = 0;
  num_up = num_down = 0;

  while ( fgets(buffer,sizeof(buffer),fp) != NULL ) { 
    parse_entry(&ent,buffer);

    /*--------------------------------------------------------*/
    /* HOST object... */
    if ( (!strcmp("host",ent.lhs)) || (!strcmp("hoststatus",ent.lhs)) ) { 

      /* host_name -> HOST_NAME... */
      fgets(buffer,sizeof(buffer),fp);
      parse_entry(&ent,buffer);
      host_list[host_list_size][HOST_NAME] = malloc(strlen(ent.rhs)+1);
      strncpy(host_list[host_list_size][HOST_NAME],ent.rhs,strlen(ent.rhs)+1);
#ifdef _DEBUG_
debug("START NEW HOST...");
debug("  host_name is %s",host_list[host_list_size][HOST_NAME]);
#endif

      /* current_state -> STATUS... */
      if ( NAGIOS_VERSION == 2 ) { 
        for (i=0; i < 9; i++) { fgets(buffer,sizeof(buffer),fp); } 
      } else {
        for (i=0; i < 13; i++) { fgets(buffer,sizeof(buffer),fp); }
      }
      parse_entry(&ent,buffer);
      switch(ent.rhs[0]) {
        case NAGIOS_HOST_UP:
          host_list[host_list_size][STATUS] = malloc(3); 
          strncpy(host_list[host_list_size][STATUS],"UP",3);
        break;
        case NAGIOS_HOST_DOWN:
          host_list[host_list_size][STATUS] = malloc(5);
          strncpy(host_list[host_list_size][STATUS],"DOWN",5);
        break;
      }
#ifdef _DEBUG_
debug("  current_state (%c) is %s",ent.rhs[0],host_list[host_list_size][STATUS]);
#endif

      /* plugin_output -> PLUGIN_OUTPUT... */
      if ( NAGIOS_VERSION == 2 ) { 
        fgets(buffer,sizeof(buffer),fp);
      } else { 
        for (i=0; i < 7; i++) { fgets(buffer,sizeof(buffer),fp); } 
      } 
      fgets(buffer,sizeof(buffer),fp);
      parse_entry(&ent,buffer);
      host_list[host_list_size][PLUGIN_OUTPUT] = malloc(strlen(ent.rhs)+1);
      strncpy(host_list[host_list_size][PLUGIN_OUTPUT],ent.rhs,strlen(ent.rhs)+1);
      perl_hook(HOST_PLUGIN_HOOK,host_list[host_list_size][PLUGIN_OUTPUT]);
#ifdef _DEBUG_
debug("  plugin_output is %s",ent.rhs);
debug("  plugin_output (post-munge) is %s",host_list[host_list_size][PLUGIN_OUTPUT]);
#endif

      /* last_state_change -> LAST_STATE_CHANGE_INT & LAST_STATE_CHANGE... */
      if ( NAGIOS_VERSION == 2 ) {
        for (i=0; i < 7; i++) { fgets(buffer,sizeof(buffer),fp); }
      } else {
        for (i=0; i < 11; i++) { fgets(buffer,sizeof(buffer),fp); }
      }
      parse_entry(&ent,buffer);
      sscanf(ent.rhs,"%d",&stamp);

      if ( (stamp == 0) && (host_list[host_list_size][PLUGIN_OUTPUT][0] == '\0') ) {
        /* PENDING... is really UP with NULL plugin output on Jan 1 1970... */
        free(host_list[host_list_size][STATUS]);
        host_list[host_list_size][STATUS] = malloc(8);
        strncpy(host_list[host_list_size][STATUS],"PENDING",7);
        free(host_list[host_list_size][PLUGIN_OUTPUT]);
        host_list[host_list_size][PLUGIN_OUTPUT] = malloc(25);
        strncpy(host_list[host_list_size][PLUGIN_OUTPUT],"(Host assumed to be up)",25);
        perl_hook(HOST_PLUGIN_HOOK,host_list[host_list_size][PLUGIN_OUTPUT]);
        stamp = last_update_int;
        host_list[host_list_size][LAST_STATE_CHANGE_INT] = (char *)(last_update_int);
        host_list[host_list_size][LAST_STATE_CHANGE] = malloc(17); 
        strncpy(host_list[host_list_size][LAST_STATE_CHANGE]," not applicable ",17);
      } else { 
        host_list[host_list_size][LAST_STATE_CHANGE_INT] = (char *)stamp;
        host_list[host_list_size][LAST_STATE_CHANGE] = malloc(17); /* "DOW Mon DD HH:MM\0" */
	new_time = stamp;
        strncpy(host_list[host_list_size][LAST_STATE_CHANGE],ctime(&new_time),16);
      }
#ifdef _DEBUG_
debug("  last_state_change is %s (%d)",
  host_list[host_list_size][LAST_STATE_CHANGE],
  (int)host_list[host_list_size][LAST_STATE_CHANGE_INT]);
#endif

      /* DURATION... */
      host_list[host_list_size][DURATION] = (char *)calc_duration(stamp);
#ifdef _DEBUG_
debug("  duration is %s",host_list[host_list_size][DURATION]);
#endif

      /* internal stuff... */
      host_idx_to_level[host_list_size] = convert_level(host_list[host_list_size][STATUS]);
      switch(host_idx_to_level[host_list_size]) {
        case UP: num_up++;     break;
        case DOWN: num_down++; break;
      }

#if _DEBUG_
      debug("READ HOST: idx=%d -> NAME=%s STATUS=%s LAST_CHANGE=%s",
        host_list_size,
        host_list[host_list_size][HOST_NAME],
        host_list[host_list_size][STATUS],
        host_list[host_list_size][LAST_STATE_CHANGE]
      );
#endif
      host_list_size++;
      continue;
    }

    /*--------------------------------------------------------*/
    /* SERVICE object... */
    if ( (!strcmp("service",ent.lhs)) || (!strcmp("servicestatus",ent.lhs)) ) { 

      /* host_name -> HOST_NAME... */
      fgets(buffer,sizeof(buffer),fp);
      parse_entry(&ent,buffer);
      service_list[service_list_size][HOST_NAME] = malloc(strlen(ent.rhs)+1);
      strncpy(service_list[service_list_size][HOST_NAME],ent.rhs,strlen(ent.rhs)+1);
#ifdef _DEBUG_
debug("START NEW SERVICE...");
debug(" host_name...");
debug("  IN %s -> %s",ent.lhs,ent.rhs);
debug("  OUT host_name is %s",service_list[service_list_size][HOST_NAME]);
#endif

      /* service_description -> SERVICE_NAME... */
      fgets(buffer,sizeof(buffer),fp);
      parse_entry(&ent,buffer);
      service_list[service_list_size][SERVICE_NAME] =
        malloc(strlen(ent.rhs)+1+strlen(service_list[service_list_size][HOST_NAME])+3);
      snprintf(service_list[service_list_size][SERVICE_NAME],(strlen(ent.rhs)+1+strlen(service_list[service_list_size][HOST_NAME])+3),"%s %s ",
        service_list[service_list_size][HOST_NAME],ent.rhs);
      perl_hook(SERVICE_PLUGIN_HOOK,service_list[service_list_size][SERVICE_NAME]);

#ifdef _DEBUG_
debug(" service_description...");
debug("  IN %s -> %s",ent.lhs,ent.rhs);
debug("  OUT service_description is %s",service_list[service_list_size][SERVICE_NAME]);
#endif

      /* current_state -> STATUS... */
      if ( NAGIOS_VERSION == 2 ) {
        for (i=0; i < 9; i++) { fgets(buffer,sizeof(buffer),fp); }
      } else {
        for (i=0; i < 13; i++) { fgets(buffer,sizeof(buffer),fp); }
      }
      parse_entry(&ent,buffer);
      switch(ent.rhs[0]) {
        case NAGIOS_STATE_OK:
          service_list[service_list_size][STATUS] = malloc(5);
          strncpy(service_list[service_list_size][STATUS],"OKAY",5);
        break;
        case NAGIOS_STATE_WARNING:
          service_list[service_list_size][STATUS] = malloc(8);
          strncpy(service_list[service_list_size][STATUS],"WARNING",8);
        break;
        case NAGIOS_STATE_CRITICAL:
          service_list[service_list_size][STATUS] = malloc(9);
          strncpy(service_list[service_list_size][STATUS],"CRITICAL",9);
        break;
        case NAGIOS_STATE_UNKNOWN:
          service_list[service_list_size][STATUS] = malloc(8);
          strncpy(service_list[service_list_size][STATUS],"UNKNOWN",8);
        break;
      }
#ifdef _DEBUG_
debug(" current_state...");
debug("  IN %s -> %s",ent.lhs,ent.rhs);
debug("  OUT current_state is %s",service_list[service_list_size][STATUS]);
#endif

      /* last_state_change -> LAST_STATE_CHANGE_INT & LAST_STATE_CHANGE... */
      if ( NAGIOS_VERSION == 2 ) {
        for (i=0; i < 5; i++) { fgets(buffer,sizeof(buffer),fp); }
      } else {
        for (i=0; i < 11; i++) { fgets(buffer,sizeof(buffer),fp); }
      }
      parse_entry(&ent,buffer);
      sscanf(ent.rhs,"%d",&stamp);
      service_list[service_list_size][LAST_STATE_CHANGE_INT] = (char *)stamp;
      service_list[service_list_size][LAST_STATE_CHANGE] = malloc(17); /* "DOW Mon DD HH:MM\0" */
      new_time = stamp;
      strncpy(service_list[service_list_size][LAST_STATE_CHANGE],ctime(&new_time),16);
#ifdef _DEBUG_
debug(" last_state_change...");
debug("  IN %s -> %s",ent.lhs,ent.rhs);
debug("  OUT last_state_change is %s (%d)",
  service_list[service_list_size][LAST_STATE_CHANGE],
  (int)service_list[service_list_size][LAST_STATE_CHANGE_INT]);
#endif

      /* DURATION... */
      service_list[service_list_size][DURATION] = (char *)calc_duration(stamp);
#ifdef _DEBUG_
debug(" duration...");
debug("  IN %s -> %s",ent.lhs,ent.rhs);
debug("  OUT duration is %s",service_list[host_list_size][DURATION]);
#endif

      /* plugin_output -> PLUGIN_OUTPUT... */
      for (i=0; i < 4; i++) { fgets(buffer,sizeof(buffer),fp); }
      parse_entry(&ent,buffer);
#ifdef _DEBUG_
debug(" plugin_output... %s vs plugin_output",ent.lhs);
#endif
      if (!strcmp(ent.lhs,"plugin_output")) {
#ifdef _DEBUG_
debug("  IN NEW VERSION 3 plugin_output (vs %s)",ent.lhs);
#endif
      } else {
#ifdef _DEBUG_
debug("  IN OLD VERSION 2 or 3 plugin_output");
#endif
        for (i=0; i < 2; i++) { fgets(buffer,sizeof(buffer),fp); }
        parse_entry(&ent,buffer);
      }
#ifdef _DEBUG_
debug("  IN %s -> %s",ent.lhs,ent.rhs);
#endif
      service_list[service_list_size][PLUGIN_OUTPUT] = malloc(strlen(ent.rhs)+1);
      strncpy(service_list[service_list_size][PLUGIN_OUTPUT],ent.rhs,strlen(ent.rhs)+1);
#ifdef _DEBUG_
debug("  OUT plugin_output before munge is %s",ent.rhs);
#endif
      perl_hook(SERVICE_PLUGIN_HOOK,service_list[service_list_size][PLUGIN_OUTPUT]);
#ifdef _DEBUG_
debug("  OUT plugin_output after munge is %s",service_list[service_list_size][PLUGIN_OUTPUT]);
#endif

      /* PENDING is really OKAY w/ "(Service assumed to be ok)" on Jan 1 1970... */
      if ( (stamp == 0) && (!strcmp("(Service assumed to be ok)",ent.rhs)) ) {
        free(service_list[service_list_size][STATUS]);
        service_list[service_list_size][STATUS] = malloc(8);
        strncpy(service_list[service_list_size][STATUS],"PENDING",8);
        stamp = last_update_int;
        service_list[service_list_size][LAST_STATE_CHANGE_INT] = (char *)stamp;
        service_list[service_list_size][LAST_STATE_CHANGE] = malloc(17); /* "DOW Mon DD HH:MM\0" */
        strncpy(service_list[service_list_size][LAST_STATE_CHANGE]," not applicable ",17);
        service_list[service_list_size][DURATION] = (char *)calc_duration(stamp);
      }

      /* internal stuff... */
      service_idx_to_level[service_list_size] = 
         convert_level(service_list[service_list_size][STATUS]);
      switch(service_idx_to_level[service_list_size]) {
        case 0: num_okay++;  break;
        case 1: num_warn++;  break;
        case 2: num_crit++;  break;
      }
#if _DEBUG_
      debug("READ SERVICE: idx=%d -> NAME=%s SERVICE=%s STATUS=%s LAST_CHANGE=%s",
        service_list_size,
        service_list[service_list_size][HOST_NAME],
        service_list[service_list_size][SERVICE_NAME],
        service_list[service_list_size][STATUS],
        service_list[service_list_size][LAST_STATE_CHANGE]
      );
#endif
      service_list_size++;
      continue;

    }

  }

  /*--------------------------------------------------------*/

  fclose(fp);

#if _DEBUG_
  debug("done with read_v23_status()");
#endif

}

/*------------------------------------------------------------------------------*/

void
parse_entry(ent,str)
struct status_dot_dat_entry *ent;
char *str;
{
  char *p;
  p = str + strlen(str) - 1;
  *p = '\0';
  while ( *str == ' ' || *str == '\t' ) { str++; }
  p = str; while ( *p != ' ' && *p != '=' && *p != '\0' ) { p++; }; 
  *p = '\0';
  p++;
  ent->lhs = str;
  ent->rhs = p;
}


