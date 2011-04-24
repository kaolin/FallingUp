AUTOMAKE_OPTIONS = foreign

#CFLAGS=-Wall -I/usr/local/include -DVERSION=\"$(VERSION)\" -DPROG="\"$(PACKAGE)\"" -DLINUX -DDATADIR="\"$(pkgdatadir)\""
CFLAGS=-Wall -DVERSION=\"$(VERSION)\" -DPROG="\"$(PACKAGE)\"" -DLINUX -DDATADIR="\"$(pkgdatadir)\""

#LDFLAGS=-L/usr/local/lib -lalut -lopenal -lGL -lGLU -lglut

#fallingupprgdir=../
#fallingup_PROGRAMS = fallingup
bin_PROGRAMS = fallingup
fallingup_SOURCES = fallingup.c imagelib.c imagelib.h os.h
