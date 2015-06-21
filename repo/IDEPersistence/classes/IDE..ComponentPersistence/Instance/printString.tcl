IDE::ComponentPersistence instproc printString {} {
    my instvar isclosed
    set info "[my getName] - [my getVersionString]" 
    if {[info exists isclosed] && $isclosed==1} {
        append info " labeled/closed"
    }
    return $info
}
