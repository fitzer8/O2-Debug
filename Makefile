#OOC=/usr/local/bin/oo2c
OOC=oo2c
OFLAGS=

PKG=Debug
LIB=liboo2c_utils

Debug:
	$(OOC) --build-package Debug
	$(OOC) $(OFLAGS) -r . --install-package $(PKG)

all: obj/$(LIB).la

configure: configure.ac
	autoconf

obj/$(LIB).la:
	$(OOC) $(OFLAGS) -r . --build-package $(PKG)

install: obj/$(LIB).la
	$(OOC) $(OFLAGS) -r . --install-package $(PKG)

uninstall:
	$(OOC) $(OFLAGS) --uninstall-package $(PKG)

clean:
	rm -Rf sym obj bin oocdoc

distclean: clean
	rm -f Makefile pkginfo.xml config.log config.status
	rm -Rf autom4te.cache

backup:
	cp src/* ~/Dropbox/SRC/o2/Libs/Debug/src

