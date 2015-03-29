PrsContext instproc xocheck_lappend {count type object command notifier} {
    if {$count>=3} {
        set ltype [my getTypeFromElem [$command getElem 3]]
    } else {
        set ltype unknown
    }
    set ltype [list list $ltype]
    my addVariableFrom [$command getElem 2] $notifier $ltype [list $type $object]
    $command setType $ltype
}
