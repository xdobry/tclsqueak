PrsVariableRef instproc checkRefAsType {rtype context notifier} {
    set rtypeName [lindex $rtype 1]
    if {$rtypeName eq ""} {
        set rtypeName unknown
    }
    set refType [lindex $rtype 0]
    if {$refType in {gref setgref}} {
        set scope global
    } else {
        set scope local
    }
    set varName [my getVariableName]
    set hasVariable [$context checkVariable $varName $rtypeName $scope]
    set mtype [$context getVariableType $varName]
    set mtype0 [lindex $mtype 0]
    if {$mtype0 eq "unknown" && $refType in {ref gref} && !$hasVariable} {
        $notifier addError "expected reference to variable of $rtypeName" [self]
        return 0
    }
    if {$mtype0 eq "unknown" && $refType eq "setref"} {
        $context addVariableFrom [self] $notifier $rtypeName
        return 1
    }
    if {$mtype0 eq "unknown" && $refType eq "setgref"} {
        $context addVariableFrom [self] $notifier $rtypeName $scope
        return 1
    }
    if {$rtypeName eq "unknown"} {
         return 1
    }
    if {$mtype0 eq "array" && [my isArray]} {
        set mtype [lrange $mtype 1 end]
        if {[$context canAssignType $rtypeName $mtype]} {
            return 1
        } else {
            # set array item type to unknown
            $context updateComplexType $varName $mtype $rtypeName $scope
            return 1
        }
    }
    if {[my isArray]} {
        set rtypeName [list array $rtypeName]
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
