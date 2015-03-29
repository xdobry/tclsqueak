PrsContext instproc check_global {count command notifier} {
    for {set x 1} {$x<=$count} {incr x} {
        my addVariableFrom [$command getElem $x] $notifier [list def] global
    }
}
