usage(){
	echo "tdmctl init: initialize the config directory."
	echo "tdmctl list: list available X sessions."
	echo "tdmctl default [session]: show/set default X session."
	echo "tdmctl check <session>: see what <session> is."
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
			[ -x $session ] && echo $(basename $session)
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
	enable)
		;;
	disable)
		;;
	*)
		usage
		;;
esac


