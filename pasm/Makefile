all: pasm

pasm: pasm.c pasmpp.c pasmexp.c pasmop.c pasmdot.c pasmstruct.c pasmmacro.c
	gcc -Wall -D_UNIX_ pasm.c pasmpp.c pasmexp.c pasmop.c pasmdot.c pasmstruct.c pasmmacro.c -o pasm

clean:	
	rm -rf *~ *.o pasm

install: all
	cp pasm /usr/bin

uninstall:
	rm /usr/bin/pasm
