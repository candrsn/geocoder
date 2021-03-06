# **********************************************************************
# * $Id: Makefile.in 
# *
# * PostGIS - Spatial Types for PostgreSQL
# * http://postgis.refractions.net
# * Copyright 2008 Mark Cave-Ayland
# *
# * This is free software; you can redistribute and/or modify it under
# * the terms of the GNU General Public Licence. See the COPYING file.
# *
# **********************************************************************

CC=gcc
CFLAGS=-g -O2  -fPIC -DPIC  -Wall -Wmissing-prototypes 

YACC=bison
LEX=flex

# Standalone LWGEOM objects
SA_OBJS = \
	measures.o \
	box2d.o \
	ptarray.o \
	lwgeom_api.o \
	lwgeom.o \
	lwpoint.o \
	lwline.o \
	lwpoly.o \
	lwmpoint.o \
	lwmline.o \
	lwmpoly.o \
	lwcollection.o \
	lwcircstring.o \
	lwcompound.o \
	lwcurvepoly.o \
	lwmcurve.o \
	lwmsurface.o \
	lwutil.o \
	lwalgorithm.o \
	lwgunparse.o \
	lwgparse.o \
	lwsegmentize.o \
	wktparse.tab.o \
	lex.yy.o \
	vsprintf.o	

SA_HEADERS = \
	liblwgeom.h \
	lwalgorithm.h

all: liblwgeom.a

liblwgeom.a: $(SA_OBJS) $(SA_HEADERS) 
	ar rs liblwgeom.a $(SA_OBJS) 	

clean:
	rm -f $(SA_OBJS) 
	rm -f liblwgeom.a 
	rm -f wktparse.tab.c wktparse.tab.h y.tab.c y.tab.h lex.yy.c 

check: liblwgeom.a
	make -C cunit check

# Command to build each of the .o files
$(SA_OBJS): %.o: %.c wktparse.tab.c wktparse.lex 
	$(CC) $(CFLAGS) -c -o $@ $<

# Commands to generate the lexer and parser from input files
wktparse.tab.h \
wktparse.tab.c: wktparse.y
	$(YACC) -vd -p lwg_parse_yy wktparse.y
#	mv -f yy.tab.c wktparse.tab.c
#	mv -f yy.tab.h wktparse.tab.h
 
lex.yy.c: wktparse.lex wktparse.tab.c wktparse.tab.h
	$(LEX) -Plwg_parse_yy -i -f -o'lex.yy.c' wktparse.lex
 
