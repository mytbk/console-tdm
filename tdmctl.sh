#!/bin/bash
#tdmctl: a tool to configure tdm

CONFDIR="$HOME/.tdm"
CACHEDIR="${CONFDIR}/cache"
PREFIX=/usr/local

init(){
	[[ "$1" = "-f" || "$1" = "--force" ]]&&rm -rf "${CONFDIR}"
	# build the directory tree if not exist
	if [[ ! -d "${CONFDIR}" ]]; then
		cp -Rv "${PREFIX}/share/tdm" "${CONFDIR}"
	else
		echo "Nothing done."
	fi
}

usage(){
	echo "tdmctl init: initialize the config directory."
	echo "tdmctl list: list available X sessions."
	echo "tdmctl cache: list cached files."
	echo "tdmctl check <session>: see what <session> is."
	echo "tdmctl default [session]: show/set default X session."
	echo "tdmctl add <name> <path> [X(default)/extra]: add a session."
	echo "tdmctl enable/disable <session>: enable/disable session."
	exit
}

check(){
	readlink "$1" || cat "$1"
}

if [ ! -n "$1" ]; then
	usage
	exit
fi


case "$1" in
	init)
		shift
		init "$@"
		;;
	list)
		for session in "$CONFDIR/sessions"/*; do
			[ -x "$session" ] && echo $(basename "$session")
		done
		;;
	cache)
		for file in "$CACHEDIR"/*; do
			fn=$(basename "$file")
			echo ${fn:1}
		done
		;;
	default)
		if [ ! -n "$2" ]; then
			echo "Checking $(readlink "$CONFDIR/default")"
			check $(readlink "$CONFDIR/default")
		elif [ -x "$CONFDIR/sessions/$2" ]; then
			echo "Setting default to $2"
			ln -sf "$CONFDIR/sessions/$2" "$CONFDIR/default"
		else
			echo "tdmctl error: $2 is not available"
		fi
		;;
	check)
		if [ ! -n "$2" ]; then
			usage
		fi
		FILE="$CONFDIR/sessions/$2"
		if [ -f "$FILE" ]; then
			check "$FILE"
		else
			echo "$2 not exist!"
			exit 1
		fi
		;;
	add)
		[ -n "$3" ]||usage
		if [[ "$4" == "X" || "$4" == "" ]]; then
			ln -s "$3" "${CONFDIR}/sessions/$2"
		elif [ "$4" == "extra" ]; then
			ln -s "$3" "${CONFDIR}/extra/$2"
		else
			usage
		fi
		;;
	enable)
		if [ -f "${CACHEDIR}/X$2" ]; then
			cp -v "${CACHEDIR}/X$2" "${CONFDIR}/sessions/$2"
		fi
		if [ -f "${CACHEDIR}/E$2" ]; then
			mv -v "${CACHEDIR}/E$2" "${CONFDIR}/extra/$2"
		fi
		;;
	disable)
		if [ ! -d "${CACHEDIR}" ]; then
			mkdir -p "${CACHEDIR}"
		fi
# backup to cache
		if [ -f "${CONFDIR}/sessions/$2" ]; then
			mv -v "${CONFDIR}/sessions/$2" "${CACHEDIR}/X$2"
		fi
		if [ -f "${CONFDIR}/extra/$2" ]; then
			mv -v "${CONFDIR}/extra/$2" "${CONFDIR}/E$2"
		fi
		;;
	*)
		usage
		;;
esac


