IDE::TclModeEditTab instproc browseSelection {} {
    set sel [my getSelection]
    if {$sel ne ""} {
        [my info parent] browseString $sel
    }
}
