PrsContext instproc check_gets {count command notifier} {
    if {$count==2} {
        my addVariableFrom [$command getElem 2] $notifier
    }
}
