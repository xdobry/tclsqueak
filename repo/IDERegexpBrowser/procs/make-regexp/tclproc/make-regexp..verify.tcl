proc make-regexp::verify exp {
	set orphans [isOrphans $exp]
	set result {}
	foreach {prefix recurse} $exp {
		if {![isBalanced $prefix]} {
			if {[llength $recurse]} {
				foreach {pp rr} $recurse {
					lappend result "$prefix$pp" $rr
				}
				if {![isBalanced $prefix] && $orphans} {
					set result [verify $result]
				}
			} else {
				lappend result "$prefix" ""
			}
		} else {
			lappend result $prefix $recurse
		}
	}
	# return result after fixing
	set result
}
