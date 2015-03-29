IDE::MethodDescription instproc printString {} {
    if {[my getType] eq "Class"} {
        set short " class"
    } else {
        set short ""
    }
    return "[my getObjectName]$short>>[my getName] - [my getVersionString]"
}
