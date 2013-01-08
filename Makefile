PREFIX=/usr/local
DESTDIR=

all: tdm tdmctl

tdmctl: tdminit.sh tdmctl.sh header
	echo "PREFIX=${PREFIX}" > hprefix
	cat header hprefix tdminit.sh tdmctl.sh > tdmctl

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	install tdm tdmctl ${DESTDIR}${PREFIX}/bin/
	cp -Rv share ${DESTDIR}${PREFIX}/

clean:
	rm hprefix tdmctl

.PHONY: clean all
