PREFIX=/usr/local
OBJECTS=tdm tdmctl tdm_text tdm_curses
DESTDIR=

all: ${OBJECTS}

tdmctl: tdminit.sh tdmctl.sh header
	echo "PREFIX=${PREFIX}" > hprefix
	cat header hprefix tdminit.sh tdmctl.sh > tdmctl

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	install ${OBJECTS} ${DESTDIR}${PREFIX}/bin/
	cp -Rv share ${DESTDIR}${PREFIX}/
	install -Dm644 bash_comp ${DESTDIR}/usr/share/bash-completion/completions/tdmctl
	install -Dm644 zsh_comp ${DESTDIR}/usr/share/zsh/site-functions/_tdmctl

uninstall:
	rm -f ${PREFIX}/bin/{tdm,tdmctl,tdm_text,tdm_curses}
	rm -rf ${PREFIX}/share/tdm
	rm -f /usr/share/bash-completion/completions/tdmctl
	rm -f /usr/share/zsh/site-functions/_tdmctl

clean:
	rm hprefix tdmctl

.PHONY: clean all install uninstall
