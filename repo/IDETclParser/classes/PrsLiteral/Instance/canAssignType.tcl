PrsLiteral instproc canAssignType {context rtype} {
    if {[my canAssignTypeBase $rtype $context]} {
        return 1
    }
    next
}
