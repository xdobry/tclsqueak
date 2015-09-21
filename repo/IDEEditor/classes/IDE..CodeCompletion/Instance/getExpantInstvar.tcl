IDE::CodeCompletion instproc getExpantInstvar {cmd contentDesc {methodName instvar}} {
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
    set subpattern {(?:\s\w+)*?\s(\w+)$}
    regexp "my $methodName$subpattern" $cmd _ pattern
    append pattern *
    my instvar repo
    set vlist [list]
    foreach {k t} [[$repo getWriteRepository] searchVariable [list ::$class $type $pattern]] {
        lappend vlist [lindex $k end]        
    }
    list $vlist $pattern
}
