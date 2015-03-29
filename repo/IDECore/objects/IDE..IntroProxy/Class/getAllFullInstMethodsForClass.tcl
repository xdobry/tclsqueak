IDE::IntroProxy proc getAllFullInstMethodsForClass {class {ignoreList {}}} {
    set fmethods {}
    foreach m [$class info instprocs] {
	lappend fmethods [list $m [$class]]
        set marr($m) 1
    }
    foreach cl [$class info heritage] {
        if {$cl in $ignoreList} continue
        foreach m [$cl info instprocs] {
	    if {![info exists marr($m)]} {
                lappend fmethods [list $m $cl]
                set marr($m) 1
            }
        }
    }
    return $fmethods
}
