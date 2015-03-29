PrsContext instproc check_lappend {count command notifier} {
    if {$count>=2} {
        set elemType [my getTypeFromElem [$command getElem 2]]
    } else {
        set elemType [list unknown]
    }
    set type [list list $elemType]
    my addVariableFrom [$command getElem 1] $notifier $type
    $command setType $type
}
