IDE::CodeCompletion instproc getExpantInstvar {cmd contentDesc} {
    lassign $contentDesc class type method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
    set atype [IDE::XOIntroProxy getAbstractMethodType $type]
    if {$atype ni {Class Instance} || ![$introProxy isObject $class]} {
        return
    }
    if {$atype eq "Instance"} {
        set type instproc
    } else {
        set type proc
    }
    regexp {my instvar(?:\s\w+)*?\s(\w+)$} $cmd _ pattern
    set pattern
    append pattern *
    my instvar repo
    set vlist [list]
    foreach {k t} [[$repo getWriteRepository] searchVariable [list $class $type $pattern]] {
        lappend vlist [lindex $k end]        
    }
    list $vlist $pattern
}
