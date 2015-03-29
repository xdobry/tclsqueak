PrsContext instproc check_set {count command notifier} {
    if {$count==2} {
        set type [my getTypeFromElem [$command getElem 2]]
        my addVariableFrom [$command getElem 1] $notifier $type [my getDefaultScope] 1
        $command setType $type
    } else {
        my checkVariableFrom [$command getElem 1] $notifier
        $command setType [my getTypeFromElem [$command getElem 1]]
    }
}
