PrsQuoted instproc canAssignType {context type} {
    if {[my canAssignTypeBase $type]} {
        return 1
    }
    next
}
