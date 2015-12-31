PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
SHAREDIR=$(PREFIX)/share
OBJECTS=tdm tdmctl
DESTDIR=

all: ${OBJECTS}

tdmctl: tdmctl.sh
	sed "s#^PREFIX.*#PREFIX=${PREFIX}#" tdmctl.sh > tdmctl

install: install_bin install_sessions install_completion

install_bin: $(OBJECTS)
	install -D $^ ${DESTDIR}${BINDIR}

install_sessions:
	install -d ${DESTDIR}${SHAREDIR}/tdm/sessions
	cp -Rv cfg/* ${DESTDIR}${SHAREDIR}/tdm/
	cat WMLIST|while read NAME DEST; \
	do \
		ln -s "$${DEST}" "${DESTDIR}${PREFIX}/share/tdm/$${NAME}"; \
	done

install_completion: bash_comp zsh_comp
## completion files must be installed in /usr/share
	install -Dm644 bash_comp ${DESTDIR}/usr/share/bash-completion/completions/tdmctl
	install -Dm644 zsh_comp ${DESTDIR}/usr/share/zsh/site-functions/_tdmctl

uninstall:
	rm -f ${PREFIX}/bin/{tdm,tdmctl}
	rm -rf ${PREFIX}/share/tdm
	rm -f /usr/share/bash-completion/completions/tdmctl
	rm -f /usr/share/zsh/site-functions/_tdmctl

clean:
	rm -f tdmctl

.PHONY: clean all install uninstall
