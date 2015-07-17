PrsContext instproc check_regexp {count command notifier} {
    # ignore switches / options
    set x [my skipOptions $command 1 {-about -expanded -indices -line -linestop -lineanchor -nocase -all -inline} {-start}]
    incr x 2
    for {} {$x<=$count} {incr x} {
        my addVariableFrom [$command getElem $x] $notifier
    }
}
