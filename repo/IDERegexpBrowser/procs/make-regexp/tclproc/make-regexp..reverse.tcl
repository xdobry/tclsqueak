proc make-regexp::reverse string {
	set result ""
	for {set i [expr [string length $string]-1]} {$i >= 0} {incr i -1} {
		append result [string index $string $i]
	}
	set result
}
