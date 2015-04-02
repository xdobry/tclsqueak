proc make-regexp::suffix list {
	# end of recursion if empty list
	if {[llength $list] == 0} {
		return ""
	}
	set newlist {}
	foreach {prefix recurse} $list {
		set result [suffix $recurse]
		lappend newlist $prefix [lindex $result 0]
	}
	# compute longest common suffixes
	set words {}
	foreach {prefix tail} $newlist {
		if {[firstLevelGroup $tail]} {
			set tail "($tail)"
		}
		lappend words [reverse $prefix$tail]
	}
	set words [lsort -unique $words]
	set reverse [prefix $words]
	# compute regexp from precomputed reverse list
	set regexp [build "" $reverse]
	# returns computed regexp
	set regexp
}
