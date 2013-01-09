###############################################################################
#
# Makefile for rogue
#
# Rogue: Exploring the Dungeons of Doom
# Copyright (C) 1980-1983, 1985, 1999 Michael Toy, Ken Arnold and Glenn Wichman
# All rights reserved.
#       
# See the file LICENSE.TXT for full copyright and licensing information.
#
###############################################################################
        
###############################################################################
# Site configuration occurs beneath this comment
# Typically ./configure (autoconf tools) configures this section
# This section could be manually configured if autoconf/configure fails
###############################################################################

DISTNAME=rogue5.4.5
PACKAGE_TARNAME = rogue-5.4.5
PROGRAM=rogue

O=o

#CC=gcc
CC    = gcc

#CFLAGS=-O2
CFLAGS= -g -O2 -coverage

#LIBS=-lcurses
LIBS =	 -lcurses

#RM=rm -f
RM    = rm -f

#GROFF=groff
GROFF = groff

#NROFF=nroff
NROFF = nroff

#TBL=tbl
TBL   = tbl

#COLCRT=colcrt
COLCRT = colcrt

#SED=sed
SED   = sed

#SCOREFILE=rogue54.scr
SCOREFILE = rogue.scr

#LOCKFILE=rogue54.lck
LOCKFILE = rogue.lck

#GROUPOWNER=games
GROUPOWNER = 

#CPPFLAGS=-DHAVE_CONFIG_H
CPPFLAGS =-DHAVE_CONFIG_H 

#DISTFILE = $(PROGRAM)
DISTFILE = $(DISTNAME)-x86_64-unknown-linux-gnu

INSTALL=./install-sh

#INSTGROUP=-g games
INSTGROUP=
#INSTOWNER=-u root
INSTOWNER=

CHGRP=chgrp

MKDIR=mkdir

TOUCH=touch

RMDIR=rmdir

CHMOD=chmod

DESTDIR=

prefix=/usr/local
exec_prefix=${prefix}
datarootdir=${prefix}/share
datadir=${datarootdir}
bindir=${exec_prefix}/bin
mandir=${datarootdir}/man
docdir=${datarootdir}/doc/${PACKAGE_TARNAME}
man6dir = $(mandir)/man6

###############################################################################
# Site configuration occurs above this comment
# It should not be necessary to change anything below this comment
############################################################################### 

HDRS     = rogue.h extern.h score.h
OBJS1    = vers.$(O) extern.$(O) armor.$(O) chase.$(O) command.$(O) \
           daemon.$(O) daemons.$(O) fight.$(O) init.$(O) io.$(O) list.$(O) \
           mach_dep.$(O) main.$(O) mdport.$(O) misc.$(O) monsters.$(O) \
           move.$(O) new_level.$(O)
OBJS2    = options.$(O) pack.$(O) passages.$(O) potions.$(O) rings.$(O) \
           rip.$(O) rooms.$(O) save.$(O) scrolls.$(O) state.$(O) sticks.$(O) \
           things.$(O) weapons.$(O) wizard.$(O) xcrypt.$(O)
OBJS     = $(OBJS1) $(OBJS2)
CFILES   = vers.c extern.c armor.c chase.c command.c daemon.c \
           daemons.c fight.c init.c io.c list.c mach_dep.c \
           main.c  mdport.c misc.c monsters.c move.c new_level.c \
           options.c pack.c passages.c potions.c rings.c rip.c \
           rooms.c save.c scrolls.c state.c sticks.c things.c \
           weapons.c wizard.c xcrypt.c
MISC_C   = findpw.c scedit.c scmisc.c
DOCSRC   = rogue.me.in rogue.6.in rogue.doc.in rogue.html.in rogue.cat.in
DOCS     = $(PROGRAM).doc $(PROGRAM).html $(PROGRAM).cat $(PROGRAM).me \
           $(PROGRAM).6
AFILES   = configure Makefile.in configure.ac config.h.in config.sub config.guess \
           install-sh rogue.6.in rogue.me.in rogue.html.in rogue.doc.in rogue.cat.in
MISC     = Makefile.std LICENSE.TXT rogue54.sln rogue54.vcproj rogue.spec \
           rogue.png rogue.desktop

.SUFFIXES: .obj

.c.obj:
	$(CC) $(CFLAGS) $(CPPFLAGS) /c $*.c
    
.c.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $*.c
    
$(PROGRAM): $(HDRS) $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o $@
    
clean:
	$(RM) $(OBJS1)
	$(RM) $(OBJS2)
	$(RM) core a.exe a.out a.exe.stackdump $(PROGRAM) $(PROGRAM).exe
	$(RM) $(PROGRAM).tar $(PROGRAM).tar.gz $(PROGRAM).zip 
	$(RM) $(DISTNAME)/*
	-rmdir $(DISTNAME)
    
maintainer-clean:
	$(RM) config.h
	$(RM) Makefile
	$(RM) config.status
	$(RM) -r autom4te.cache
	$(RM) config.log
	$(RM) $(PROGRAM).scr $(PROGRAM).lck

stddocs:
	sed -e 's/rogue/rogue/' -e 's/rogue.scr/rogue.scr/' rogue.6.in > rogue.6
	sed -e 's/rogue/rogue/' -e 's/rogue.scr/rogue.scr/' rogue.me.in > rogue.me
	sed -e 's/rogue/rogue/' -e 's/rogue.scr/rogue.scr/' rogue.html.in > rogue,html
	sed -e 's/rogue/rogue/' -e 's/rogue.scr/rogue.scr/' rogue.doc.in > rogue.doc
	sed -e 's/rogue/rogue/' -e 's/rogue.scr/rogue.scr/' rogue.cat.in > rogue.cat

dist.src:
	$(MAKE) $(MAKEFILE) clean
	mkdir $(DISTNAME)
	cp $(CFILES) $(HDRS) $(MISC) $(AFILES) $(DISTNAME)
	tar cf $(DISTNAME)-src.tar $(DISTNAME)
	gzip -f $(DISTNAME)-src.tar
	rm -fr $(DISTNAME)

findpw: findpw.c xcrypt.o mdport.o xcrypt.o
	$(CC) -s -o findpw findpw.c xcrypt.o mdport.o -lcurses

scedit: scedit.o scmisc.o vers.o mdport.o xcrypt.o
	$(CC) -s -o scedit vers.o scedit.o scmisc.o mdport.o xcrypt.o -lcurses

scmisc.o scedit.o:
	$(CC) -O -c $(SF) $*.c

$(PROGRAM).doc: rogue.me
	if test "x$(GROFF)" != "x" -a "x$(SED)" != "x" ; then \
	$(GROFF) -P-c -t -me -Tascii rogue.me | $(SED) -e 's/.\x08//g' > $(PROGRAM).doc ;\
	elif test "x$(NROFF)" != "x" -a "x$(TBL)" != "x" -a "x$(COLCRT)" != "x" ; then \
        tbl rogue.me | $(NROFF) -me | colcrt - > $(PROGRAM).doc ;\
	fi

$(PROGRAM).cat: rogue.6
	if test "x$(GROFF)" != "x" -a "x$(SED)" != "x" ; then \
	$(GROFF) -Tascii -man rogue.6 | $(SED) -e 's/.\x08//g' > $(PROGRAM).cat ;\
	elif test "x$(NROFF)" != "x" -a "x$(TBL)" != "x" -a "x$(COLCRT)" != "x" ; then \
	$(NROFF) -man rogue.6 | $(COLCRT) - > $(PROGRAM).cat ;\
	fi

dist: clean $(PROGRAM)
	tar cf $(DISTFILE).tar $(PROGRAM) LICENSE.TXT $(DOCS)
	gzip -f $(DISTFILE).tar

install: $(PROGRAM)
	-$(TOUCH) test
	-if test ! -f $(DESTDIR)$(SCOREFILE) ; then $(INSTALL) -m 0664 test $(DESTDIR)$(SCOREFILE) ; fi
	-$(INSTALL) -m 0755 $(PROGRAM) $(DESTDIR)$(bindir)/$(PROGRAM)
	-if test "x$(GROUPOWNER)" != "x" ; then \
	    $(CHGRP) $(GROUPOWNER) $(DESTDIR)$(SCOREFILE) ; \
	    $(CHGRP) $(GROUPOWNER) $(DESTDIR)$(bindir)/$(PROGRAM) ; \
	    $(CHMOD) 02755 $(DESTDIR)$(bindir)/$(PROGRAM) ; \
	    $(CHMOD) 0464 $(DESTDIR)$(SCOREFILE) ; \
         fi
	-if test -d $(man6dir) ; then $(INSTALL) -m 0644 rogue.6 $(DESTDIR)$(man6dir)/$(PROGRAM).6 ; fi
	-if test ! -d $(man6dir) ; then $(INSTALL) -m 0644 rogue.6 $(DESTDIR)$(mandir)/$(PROGRAM).6 ; fi
	-$(INSTALL) -m 0644 rogue.doc $(DESTDIR)$(docdir)/$(PROGRAM).doc
	-$(INSTALL) -m 0644 rogue.html $(DESTDIR)$(docdir)/$(PROGRAM).html
	-$(INSTALL) -m 0644 rogue.cat $(DESTDIR)$(docdir)/$(PROGRAM).cat
	-$(INSTALL) -m 0644 LICENSE.TXT $(DESTDIR)$(docdir)/LICENSE.TXT
	-$(INSTALL) -m 0644 rogue.me $(DESTDIR)$(docdir)/$(PROGRAM).me
	-if test ! -f $(DESTDIR)$(LOCKFILE)  ; then $(INSTALL) -m 0666 test $(DESTDIR)$(LOCKFILE)  ; $(RM) $(DESTDIR)$(LOCKFILE) ; fi
	-$(RM) test

uninstall:	
	-$(RM) $(DESTDIR)$(bindir)/$(PROGRAM)
	-$(RM) $(DESTDIR)$(man6dir)/$(PROGRAM).6
	-$(RM) $(DESTDIR)$(docdir)$(PROGRAM)/$(PROGRAM).doc
	-$(RM) $(DESTDIR)$(LOCKFILE)
	-$(RMDIR) $(DESTDIR)$(docdir)$(PROGRAM)
    
reinstall: uninstall install
