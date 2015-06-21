PrsContext instproc xocheck_instvar {count type object command notifier} {
    my instvar repository
    for {set x 2} {$x<=$count} {incr x} {
        set varElem [$command getElem $x]
        set varName [$varElem prsString]
        if {[my checkVariable $varName]} {
            $notifier addError "variable '$varName' already in method context" $varElem
        } else {
            my addVariableFrom $varElem $notifier [list def] [list $type $object]
        }
    }
}
