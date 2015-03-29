PrsLiteral instproc checkRefAsType {rtype context notifier} {
    set rtypeName [lindex $rtype 1]
    set refType [lindex $rtype 0]
    set varName [my getVariableName]
    set hasVariable [$context checkVariable $varName]
    set mtype [$context getVariableType $varName]
    set mtype0 [lindex $mtype 0]
    if {$mtype0 eq "unknown" && $refType eq "ref" && !$hasVariable} {
        $notifier addError "expected reference to variable of $rtypeName" [self]
        return 0
    }
    if {$mtype0 eq "unknown" && $refType eq "setref"} {
        $context addVariableFrom [self] $notifier $rtypeName
        return 1
    }
    if {$rtypeName eq "unknown"} {
         return 1
    }
    if {[$context checkVariableType $varName $rtypeName]} {
        return 1
    }
    if {$mtype0 eq "array"} {
        $notifier addError "can not use array as reference to '$rtypeName'" [self]
    } else {
        $notifier addError "possibly error expect variable reference of type '$rtypeName' seems to be '$mtype'" [self]
    }
    return 0
}
