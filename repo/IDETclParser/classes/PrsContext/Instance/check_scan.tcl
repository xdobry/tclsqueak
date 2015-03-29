PrsContext instproc check_scan {count command notifier} {
    for {set x 2} {$x<=$count} {incr x} {
        my addVariableFrom [$command getElem $x] $notifier
    }
}
