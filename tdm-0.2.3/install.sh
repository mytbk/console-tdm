#!/bin/bash

if [[ ! -n ${PREFIX} ]]; then
	PREFIX="/usr/local"
fi

if [[ ! -n ${DESTDIR} ]]; then
	DESTDIR="/"
fi

echo "install to ${PREFIX}"
install tdm ${DESTDIR}/${PREFIX}/bin/tdm
SED_COMMAND="/PREFIX/{s#\$#${PREFIX}#g}"
sed -i "${SED_COMMAND}" ${DESTDIR}/${PREFIX}/bin/tdm
cp -Rv share ${DESTDIR}/${PREFIX}/

