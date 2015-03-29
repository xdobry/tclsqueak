IDE::ObjectDescription instproc printString {} {
    my instvar isclosed
    set info "[my getType] [my getObjectName] - [my getVersionString]" 
    if {[info exists isclosed] && $isclosed==1} {
        append info " versioned"
    }
    return $info
}
