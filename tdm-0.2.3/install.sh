#!/bin/bash

if [[ ! -n ${PREFIX} ]]; then
	PREFIX="/usr/local"
fi

echo "install to ${PREFIX}"
install tdm ${DESTDIR}${PREFIX}/bin/tdm
install tdmctl ${DESTDIR}${PREFIX}/bin/tdmctl
SED_COMMAND="/PREFIX=/{s#\$#${PREFIX}#g}"
sed -i "${SED_COMMAND}" ${DESTDIR}${PREFIX}/bin/tdm
cp -Rv share ${DESTDIR}${PREFIX}/

