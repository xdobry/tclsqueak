proc make-regexp::build {mainstem reverse} {
	# flag to indicate need for '?' (optional group)
	set addQuestionMark 0
	set regexp ""
	foreach {prefix recurse} $reverse {
		set stem "[reverse $prefix]$mainstem"
		if {[llength $recurse]} {
			set fromlower [build $stem $recurse]
		} else {
			set fromlower ""
		}
		# build regexp
		if {$prefix == ""} {
			set addQuestionMark 1
		} else {
			if {[string length $fromlower] > 1 && [string index $fromlower end] != "?"} {
				set fromlower "($fromlower)"
			}
			append regexp "$fromlower[reverse $prefix]|"
		}
	}
	# remove last trailing '|'
	set regexp "[string range $regexp 0 end-1]"
	# add '?' if needed
	if {$addQuestionMark} {
		if {[string length $regexp] == 1} {
			set regexp "$regexp?"
		} else {
			set regexp "($regexp)?"
		}
	}
	# result
	set regexp
}
