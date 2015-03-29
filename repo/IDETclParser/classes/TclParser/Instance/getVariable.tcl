TclParser instproc getVariable parent {
    my instvar stream
    if {![my isRealVariableBegin]} {
        return
    }
    set variable [PrsVariable new -childof $parent -begin [$stream pos]]
    $stream addPos 1
    set firstChar [$stream getChar]
    set varNameStartPos [$stream pos]
    if {$firstChar eq "\{"} {
        my parseNoSubst
        # TODO set a(1) 1  ;  list ${a(1)}
        incr varNameStartPos
        set varNameEndPos [expr {[$stream pos]-1}]
        $variable end [expr {$varNameEndPos+1}]
        $stream addPos 1
    } else {
        my skipToWordEnd
        set varNameEndPos [expr {[$stream pos]-1}]
        $variable end $varNameEndPos
        my getArrayKey $variable
    }
    $variable set varName [$stream copyFromTo $varNameStartPos $varNameEndPos]
    return $variable
}
