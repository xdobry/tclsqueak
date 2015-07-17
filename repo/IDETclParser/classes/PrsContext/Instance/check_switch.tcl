PrsContext instproc check_switch {count command notifier} {
    set x [my skipOptions $command 1 {-exact -glob -regexp -nocase} {-matchvar -indexvar}]
    if {$count-$x==1} {
        set last [$command getElem end]
        $last extractList
        set patterns [$last getAsList]
    } else {
        set patterns [list]
        incr x
        for {} {$x<=$count} {incr x} {
            lappend patterns [$command getElem $x]        
        }
    }
    if {[llength $patterns]%2!=0} {
        my addError "expect odd elements in the list" [lindex $patterns 0]
    }
    foreach {pattern script} $patterns {
        if {$script ne ""} {my evalContents $script}
    }
}
