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
	install -Dm644 tdm_comp.sh ${DESTDIR}/usr/share/bash-completion/completions/tdmctl

uninstall:
	rm -f ${PREFIX}/bin/{tdm,tdmctl}
	rm -rf ${PREFIX}/share/tdm
	rm -f /usr/share/bash-completion/completions/tdmctl
	
clean:
	rm hprefix tdmctl

.PHONY: clean all install uninstall
