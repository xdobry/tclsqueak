PrsElement instproc checkAsType {rtype context notifier} {
    set mtype [my getTypeWithContext $context $rtype]
    if {[$context canAssignType $rtype $mtype]} {
         return 1
    }
    set rtypeName [lindex $rtype 0]
    if {$rtypeName in {ref setref wref gref setgref}} {
        my parseAsVariableRef
        return [my checkRefAsType $rtype $context $notifier]
    } else {
        if {[lindex $mtype 0] eq "array"} {
            $notifier addError "can not use array as $rtypeName" [self]
        } else {
            $notifier addError "possibly error expect as '[join $rtype]' but is '[join $mtype]'" [self]
        }
        return 0
    }
}
