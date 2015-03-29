proc make-regexp::prefix words {
	# init
	set result {}
	lappend words ""		;# to force last completion
	# group by first letter
	set prefix [string range [lindex $words 0] 0 0]
	set subwords [list [string range [lindex $words 0] 1 end]]
	foreach word [lrange $words 1 end] {
		set char [string range $word 0 0]
		if {$char == $prefix} {
			lappend subwords [string range $word 1 end]
		} else {
			# compute prefixes recursively
			set recurse [prefix $subwords]
			if {[llength $recurse] == 2} {
				# only one prefix, so concat with previous prefix
				append prefix [lindex $recurse 0]
				set recurse [lindex $recurse 1]
			}
			append result " [verify [list $prefix $recurse]]"
			set prefix $char
			set subwords [list [string range $word 1 end]]
		}
	}
	# return
	set result
}
