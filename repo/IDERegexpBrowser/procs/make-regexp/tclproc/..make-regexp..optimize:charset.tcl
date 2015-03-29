proc ::make-regexp::optimize:charset regexp {
	set optimized ""
	set memory ""
	set ok 1
	set charset ""
	# examine char one by one
	set len [string length $regexp]
	for {set i 0} {$i < $len} {incr i} {
		set char [string index $regexp $i]
		append memory $char
		if {$char eq "("} {
			# start of group
			if {$ok} {
				append optimized [string range $memory 0 end-1]
			}
			incr i
			set result [optimize:charset [string range $regexp $i end]]
			append optimized "[lindex $result 2][lindex $result 0][lindex $result 3]"
			set memory ""
			set ok 0
			incr i [expr [lindex $result 1]]
			continue
		} elseif {$char  eq ")"} {
			# end of group
			if {$ok} {
				set optimized "\[$charset\]"
				return [list $optimized $i "" ""]
			} else {
				return [list $optimized $i "(" ")"]
			}
		}
		if {$ok} {
			if {$i & 1} {
				if {$char != "|"} {
					set ok 0
					append optimized $memory
				}
			} else {
				append charset $char
			}
		} else {
			append optimized $char
		}
	}
	# return result
	list $optimized $i "(" ")"
}
