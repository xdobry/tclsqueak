IDE::DBPersistence instproc isclosed {} {
    my instvar isclosed
    if {![info exists isclosed] || $isclosed eq ""} { return 0}
    return [expr $isclosed==1]
}
