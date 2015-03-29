PrsContext instproc check_lmap {count command notifier} {
    for {set x 1} {$x<$count} {incr x 2} {
        set variablesRefElem [$command getElem $x]
        if {[$variablesRefElem hasclass PrsQuoted]} {
            # for example foreach "a b c" $list break
            $variablesRefElem changeToLiteralListIfPossible
        }
        my addVariableFromList $variablesRefElem $notifier
        set listElem [$command getElem [expr {$x+1}]]
        $listElem extractList
        $listElem checkAsType list [self] $notifier
    }
    if {$x<=$count} {
        my evalContents [$command getElem $x]
        $command setType [my getTypeFromElem [$command getElem $x]]
    } else {
        $notifier addError "expect body as last foreach parameter" [$command getElem 0]
    }
}
