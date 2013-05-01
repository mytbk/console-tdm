nulltype(){
	type "$1" > /dev/null 2>/dev/null
}

get_needs(){
	grep '#[ \t]*needs[ \t]*:' "$1"|sed -e 's/#.*://g'
}

valid_item(){
	local needs
	needs=($(get_needs "$1"))
	for _i in ${needs[@]}
	do
		nulltype ${_i} || return 1
	done
	return 0
}

