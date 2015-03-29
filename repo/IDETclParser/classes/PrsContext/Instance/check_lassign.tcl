PrsContext instproc check_lassign {count command notifier} {
    for {set i 2} {$i<=$count} {incr i} {
        my addVariableFrom [$command getElem $i] $notifier
    }
}
