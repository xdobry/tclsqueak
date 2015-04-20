PrsContext instproc findLineForPos {linespos pos} {
    set line 0
    foreach lp $linespos {
        if {$pos<$lp} {
            break
        }
        incr line
    }
    return $line
}
