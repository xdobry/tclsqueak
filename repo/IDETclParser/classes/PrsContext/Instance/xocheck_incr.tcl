PrsContext instproc xocheck_incr {count type object command notifier} {
    my addVariableFrom [$command getElem 2] $notifier int [list $type $object]
}
