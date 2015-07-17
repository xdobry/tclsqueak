IDE::CodeCompletion instproc getBaseIdentifiers {pattern contentDesc} {
    lassign $contentDesc class type method
    if {[string range $pattern 0 1] eq "::"} {
        if {[namespace exists [string range $pattern 0 end-1]]} {
            set ns [string range $pattern 0 end-1]
            set pattern ${ns}::*
        } else {
            set ns [namespace qualifiers $pattern]
        }
    } else {
        if {$class ne ""} {
            set ns $class
        } else {
            set ns $method
        }
        set ns [namespace qualifiers $ns]
    }
    if {[string range $ns 0 2] ne "::"} {
        set ns "::$ns"
    }
    if {$ns ne "::" && [namespace exists $ns]} {
        lappend mlist {*}[namespace eval $ns info procs $pattern]
        lappend mlist {*}[namespace eval $ns info commands $pattern]
    }
    if {[string range $pattern 0 1] eq "::" && [namespace exists $ns]} {
        lappend mlist {*}[namespace children $ns [namespace tail $pattern]]
    }
    
    lappend mlist {*}[namespace eval :: info procs $pattern]
    lappend mlist {*}[namespace eval :: info commands $pattern]
    set mlist [lsort -unique $mlist]
    list $mlist $pattern
}
