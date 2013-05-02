PREFIX=/usr/local
OBJECTS=tdm tdmctl tdm_core
DESTDIR=

all: ${OBJECTS}

tdmctl: tdminit.sh tdmctl.sh header
	echo "PREFIX=${PREFIX}" > hprefix
	cat header hprefix tdminit.sh tdmctl.sh > tdmctl

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	install ${OBJECTS} ${DESTDIR}${PREFIX}/bin/
	install -d ${DESTDIR}${PREFIX}/share/tdm/sessions
	cp -Rv cfg/* ${DESTDIR}${PREFIX}/share/tdm/
	cat WMLIST|while read NAME DEST; \
	do \
		ln -s "$${DEST}" "${DESTDIR}${PREFIX}/share/tdm/$${NAME}"; \
	done 
	install -Dm644 bash_comp ${DESTDIR}/usr/share/bash-completion/completions/tdmctl
	install -Dm644 zsh_comp ${DESTDIR}/usr/share/zsh/site-functions/_tdmctl

uninstall:
	rm -f ${PREFIX}/bin/{tdm,tdmctl,tdm_core}
	rm -rf ${PREFIX}/share/tdm
	rm -f /usr/share/bash-completion/completions/tdmctl
	rm -f /usr/share/zsh/site-functions/_tdmctl

clean:
	rm hprefix tdmctl

.PHONY: clean all install uninstall
