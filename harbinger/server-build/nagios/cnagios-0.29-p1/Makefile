#
# $Id: Makefile.in,v 1.25 2010/10/16 02:28:31 rader Exp $
#


HDRS = cnagios.h version.h
SRCS = cnagios.c draw.c read.c debug.c cmds.c help.c perl.c update.c dotfile.c readv1.c readv23.c
OBJS = cnagios.o draw.o read.o debug.o cmds.o help.o perl.o update.o dotfile.o readv1.o readv23.o

CC      = /usr/bin/cc
DEFINES = -D_DEBUG_ 
LIBS    = -lcurses 

PERL_CFLAGS  =  -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fstack-protector -fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64  -I/usr/lib/perl/5.18/CORE 
PERL_LIBS    = -lgdbm -lgdbm_compat -ldb -ldl -lm -lpthread -lc -lcrypt
PERL_LDFLAGS = -Wl,-E  -fstack-protector -L/usr/local/lib  -L/usr/lib/perl/5.18/CORE -lperl -ldl -lm -lpthread -lc -lcrypt

INSTALL = config/install-sh


.c.o: $(HDRS)
	$(CC) -o $*.o -c $*.c $(CFLAGS) $(PERL_CFLAGS) $(DEFINES) 

cnagios: $(OBJS) $(HDRS)
	$(CC) -o cnagios $(OBJS) ${CFLAGS} $(LDFLAGS) $(DEFINES) $(LIBS) $(PERL_LDFLAGS)
	@echo "next do \"make install\""


install:
	@if [ -f /usr/local/bin/cnagios ]; then \
	  echo mv /usr/local/bin/cnagios /usr/local/bin/cnagios.OLD ; \
	  mv /usr/local/bin/cnagios /usr/local/bin/cnagios.OLD ; \
	fi
	@echo installing cnagios in /usr/local/bin
	@$(INSTALL) -c -m 755 cnagios /usr/local/bin/cnagios

	@echo installing cnagios.1 in /usr/local/man/man1
	@$(INSTALL) -c -m 755 cnagios.1 /usr/local/man/man1/cnagios.1

	@if [ ! -f /etc/nagios3/cnagiosrc ]; then \
	  echo installing cnagiosrc in /etc/nagios3 ; \
	  $(INSTALL) -c -m 644 cnagiosrc /etc/nagios3/cnagiosrc ; \
	else \
	  echo installing cnagiosrc as /etc/nagios3/cnagiosrc.NEW ; \
	  $(INSTALL) -c -m 644 cnagiosrc /etc/nagios3/cnagiosrc.NEW ; \
	fi

	@if [ ! -f /etc/nagios3/cnagios.help ]; then \
	  echo installing cnagios.help in /etc/nagios3 ; \
	  $(INSTALL) -c -m 644 cnagios.help /etc/nagios3/cnagios.help ; \
	else \
	  echo installing cnagios.help as /etc/nagios3/cnagios.help.NEW ; \
	  $(INSTALL) -c -m 644 cnagios.help /etc/nagios3/cnagios.help.NEW ; \
	fi

	@if [ ! -f /etc/nagios3/cnagios.pl ]; then \
	  echo installing cnagios.pl in /etc/nagios3 ; \
	  $(INSTALL) -c -m 644 cnagios.pl /etc/nagios3/cnagios.pl ; \
	else \
	  echo installing cnagios.pl as /etc/nagios3/cnagios.pl.NEW ; \
	  $(INSTALL) -c -m 644 cnagios.pl /etc/nagios3/cnagios.pl.NEW ; \
	fi

install2:
	@if [ -f /usr/local/bin/cnagios ]; then \
	  echo sudo mv /usr/local/bin/cnagios /usr/local/bin/cnagios.OLD ; \
	  sudo mv /usr/local/bin/cnagios /usr/local/bin/cnagios.OLD ; \
	fi
	sudo $(INSTALL) -c -m 755 cnagios /usr/local/bin/cnagios
	sudo $(INSTALL) -c -m 644 cnagios.1 /usr/local/man/man1/cnagios.1

clean:
	rm -f *.o cnagios core


status.log::
	@make -f .makefile status.log
autoconf:
	@make -f .makefile autoconf
release:
	@make -f .makefile release
push:
	@make -f .makefile push

