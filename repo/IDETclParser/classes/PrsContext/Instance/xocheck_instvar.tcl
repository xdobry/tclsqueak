PrsContext instproc xocheck_instvar {count type object command notifier} {
    my instvar repository
    for {set x 2} {$x<=$count} {incr x} {
        my addVariableFrom [$command getElem $x] $notifier [list def] [list $type $object]
    }
}
