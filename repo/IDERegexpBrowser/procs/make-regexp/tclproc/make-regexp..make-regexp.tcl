proc make-regexp::make-regexp words {
	set words [lsort -unique $words]
	# escape special chars used to form regexp
	regsub -all -- {\|} $words "\x01" words
	regsub -all -- {\(} $words "\x02" words
	regsub -all -- {\)} $words "\x03" words
	regsub -all -- {\?} $words "\x04" words
	regsub -all -- {\[} $words "\x07" words
	regsub -all -- {\]} $words "\x08" words
	# do it
	set list [prefix $words]
	set regexp [suffix $list]
	# returns regexp
  	set regexp [lindex [optimize:charset $regexp] 0]
	# un-escape special chars used to form regexp
	regsub -all -- "\x01" $regexp "\\|" regexp
	regsub -all -- "\x02" $regexp "\\(" regexp
	regsub -all -- "\x03" $regexp "\\)" regexp
	regsub -all -- "\x04" $regexp "\\?" regexp
	regsub -all -- "\x07" $regexp "\\\[" regexp
	regsub -all -- "\x08" $regexp "\\\]" regexp
	regsub -all -- "\\*" $regexp "\\*" regexp
	regsub -all -- "\\+" $regexp "\\+" regexp
	regsub -all -- "\\\$" $regexp "\$" regexp
	regsub -all -- "\\\^" $regexp "\\\^" regexp
	# returns result
	set regexp
}
