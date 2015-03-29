proc make-regexp::isBalanced str {
	# if start with '?' skip it
	if {[string index $str 0] == "?"} {
		return 0
	}
	# must start with a ')'
	if {[string index $str 0] != ")"} {
		return 1
	}
	# try to balanced each ')' with an appropriate '('
	set depth 0
	foreach c [split $str {}] {
		if {$c == "("} {
			incr depth -1
		} elseif {$c == ")"} {
			incr depth +1
		}
	}
	return [expr $depth == 0]
}
