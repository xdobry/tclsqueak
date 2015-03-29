IDE::ProgEdit instproc getBaseIdentifiers pattern {
    set twin [my getTextWindow]
    set class [$twin get 1.0 {1.0 lineend}]
    regexp {(^[\w:]+)\s+([\w:]+)} $class _ class method
    set mlist [list]
    if {[Object isobject $class]} {
        set ns $class
    } elseif {$class eq "proc"} {
        set ns $method
    } else {
        set ns ::
    }
    set ns [namespace qualifiers $ns]
    if {[string range $ns 0 2] ne "::"} {
        set ns "::$ns"
    }
    if {[namespace exists $ns]} {
        set mlist [namespace eval $ns info procs $pattern]
        set mlist [concat $mlist [namespace eval $ns info commands $pattern]]
    }
    set mlist [concat $mlist [namespace eval :: info procs $pattern]]
    set mlist [concat $mlist [namespace eval :: info commands $pattern]]
    set mlist [lsort -unique $mlist]
    my invokePopDown $mlist $pattern
}
