PrsLiteral instproc canAssignType {context rtype} {
    my instvar type
    if {[my canAssignTypeBase $rtype $context]} {
        return 1
    }
    next
}
