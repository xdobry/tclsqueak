PrsContext instproc xocheck_append {count type object command notifier} {
    if {$count>=3} {
        set ltype [my getTypeFromElem [$command getElem 3]]
    } else {
        set ltype [list unknown]
    }
    set ltype [list string]
    my addVariableFrom [$command getElem 2] $notifier $ltype [list $type $object]
    $command setType $ltype
}
