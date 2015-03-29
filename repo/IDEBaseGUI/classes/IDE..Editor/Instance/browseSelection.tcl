IDE::Editor instproc browseSelection {} {
    set sel [my getSelection]
    if {$sel ne ""} {
        IDE::System browseString $sel
    }
}
