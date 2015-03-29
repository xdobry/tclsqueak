TclParser instproc parseVariableRef variable {
    my instvar stream
    set varNameStartPos [$stream pos]
    if {[$stream getChar] eq "\{"} {
        my parseNoSubst
        # TODO set a(1) 1  ;  list ${a(1)}
        incr varNameStartPos
        set varNameEndPos [expr {[$stream pos]-1}]
        $variable end [expr {$varNameEndPos+1}]
        $stream addPos 1
    } else {
        my skipUpTo (
        # TODO if array is not closed than ( is handled as usuall character
        # try set a(1 1
        set varNameEndPos [expr {[$stream pos]-1}]
        $variable end $varNameEndPos
        my getArrayKey $variable
    }
    $variable set varName [$stream copyFromTo $varNameStartPos $varNameEndPos]
    return $variable
}
