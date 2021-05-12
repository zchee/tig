# -*- makefile-gmake -*-

prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
mandir = ${datarootdir}/man
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}
datarootdir = ${prefix}/share
sysconfdir = /usr/local/etc

CC = clang
CFLAGS = -march=native -Ofast -flto -std=c17 -D_DARWIN_C_SOURCE -I/usr/local/opt/ncurses-head/include/ncursesw -I/usr/local/opt/ncurses-head/include -DHAVE_CONFIG_H -DHAVE_NCURSESW_CURSES_H -I/usr/local/opt/readline/include 
# CURSES_CFLAGS contain `-I..` flags so add to preprocessor flags.
# CPPFLAGS =  -D_DARWIN_C_SOURCE -I/usr/local/Cellar/ncurses-head/HEAD-7972333/include/ncursesw -I/usr/local/Cellar/ncurses-head/HEAD-7972333/include -DHAVE_CONFIG_H
LDFLAGS = -march=native -Ofast -flto -Wl,-search_paths_first /usr/local/opt/ncurses-head/lib/libncursestw.a /usr/local/opt/pcre2/lib/libpcre2-8.a /usr/local/opt/pcre2/lib/libpcre2-posix.a /usr/local/opt/readline/lib/libreadline.a
# LDLIBS =  -lreadline  -liconv -L/usr/local/Cellar/ncurses-head/HEAD-7972333/lib -L/usr/local/Cellar/pcre2/10.36/lib -Wl,-search_paths_first -lncursesw -lpcre2-posix

ASCIIDOC = asciidoc
XMLTO = xmlto
DOCBOOK2PDF = false

LCOV = 
GENHTML = 

# Special compatibility features
# NO_MKSTEMPS = y
# NO_SETENV = y
# NO_STRNDUP = y
# NO_WORDEXP = y

# Add config.h as a dependency for all object files
CONFIG_H = config.h

config.status: configure
	./config.status --recheck

config.h config.make: config.status
	./config.status $@

config.make: config.make.in
