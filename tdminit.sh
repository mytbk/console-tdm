
init(){
	[[ "$1" = "-f" || "$1" = "--force" ]]&&rm -rf "${CONFDIR}"
	# build the directory tree if not exist
	if [[ ! -d "${CONFDIR}" ]]; then
		cp -Rv "${PREFIX}/share/tdm" "${CONFDIR}"
	else
		echo "Nothing done."
	fi
}

