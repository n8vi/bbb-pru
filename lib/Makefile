TARGET = libprussdrv

CC = gcc
AR = ar

INCLUDEDIR = ../include

C_FLAGS += -I. -Wall -I$(INCLUDEDIR) 

COMPILE.c = $(CC) $(C_FLAGS) $(CPP_FLAGS) -c
AR.c	  = $(AR) rc

RELTARGET = $(TARGET).a

RELCFLAGS = -O3 -mtune=cortex-a8 -march=armv7-a

SOURCES = $(wildcard *.c)
HEADERS = $(wildcard *.h)

TARGETHEADERS = $(addprefix $(INCLUDEDIR)/, $(HEADERS))

RELOBJFILES = $(SOURCES:%.c=%.o) 

.PHONY: clean release install uninstall

all:	release

install: all
	cp libprussdrv.a /usr/lib/

uninstall:
	 rm /usr/lib/libprussdrv.a

release:	$(RELTARGET) 

$(RELTARGET):	$(RELOBJFILES)
	$(AR.c) $@ $(RELOBJFILES)

$(RELOBJFILES):	%.o: %.c $(HEADERS)
	$(COMPILE.c) $(RELCFLAGS) -o $@ $<

$(TARGETHEADERS): $(HEADERS)
	@echo Installing headers...
	@install -d $(INCLUDEDIR)
	@install -c $< $@

clean:
	-rm -rf *~ *.a *.o

