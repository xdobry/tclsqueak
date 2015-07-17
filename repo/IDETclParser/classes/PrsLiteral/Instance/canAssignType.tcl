PrsLiteral instproc canAssignType {context rtype} {
    set ret [my canAssignTypeBase $rtype $context]
    if {$ret==1 || $ret==0} {
        return $ret
    } else {
        next
    }
}
