proc make-regexp::firstLevelGroup str {
	set depth 0
	foreach c [split $str {}] {
		if {$c == "("} {
			incr depth -1
		} elseif {$c == ")"} {
			incr depth +1
		} elseif {$depth == 0 && $c == "|"} {
			return 1
		}
	}
	return 0
}
