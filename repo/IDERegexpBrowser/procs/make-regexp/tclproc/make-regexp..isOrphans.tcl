proc make-regexp::isOrphans exp {
	set orphan 0
	foreach {prefix recurse} $exp {
		if {[string index $prefix 0] == "|"} {
			set orphan 1
			break
		}
		if {[isOrphans $recurse]} {
			set orphan 1
			break
		}
	}
	set orphan
}
