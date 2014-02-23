all:
	(cd lib; make)
	(cd include; make)
	(cd pasm; make)

install:
	(cd lib; make install)
	(cd include; make install)
	(cd pasm; make install)

uninstall:
	(cd lib; make uninstall)
	(cd include; make uninstall)
	(cd pasm; make uninstall)

clean:
	rm -f *~
	(cd lib; make clean)
	(cd include; make clean)
	(cd pasm; make clean)
