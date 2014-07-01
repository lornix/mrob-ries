#
# Generic compiles-it-all Makefile
#  Loni Nix <lornix@lornix.com>
#    Last modified 2013-07-28
#
# adhere to a higher standard!
#CFLAGS+=-std=c99
# pretty much always want debugging symbols included
CFLAGS+=-ggdb3
# yell out all warnings and whatnot
CFLAGS+=-Wall -Wextra -Wunused
# make all warnings into errors
#CFLAGS+=-Werror
# optimize!
#CFLAGS+=-O3
# or not!
CFLAGS+=-O0
CFLAGS+=-flto
# enable for gmon performance statistics
#CFLAGS+=-pg
# preserve everything used to create binary, verbose assembly comments
#CFLAGS+=-masm=intel --save-temps -fverbose-asm
# if we're playing with threaded code
#CFLAGS+=-pthread
# generate report showing time spent in each phase of compilation
#CFLAGS+=-ftime-report
# general call log
#CFLAGS+=-fdump-tree-cfg-lineno
#
# das linker flags
LDFLAGS+=-lm
LDFLAGS+=-flto
#
CC:=gcc
#
.SUFFIXES:
.SUFFIXES: .c .o
#
SHELL=/bin/bash
#
CSRC:=$(wildcard *.c)
CPRG:=$(basename $(CSRC))
COBJ:=$(addsuffix .o,$(CPRG))
#
.PHONY: all clean

all: $(CPRG)

% : %.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<

clean:
	rm -f $(CPRG)


