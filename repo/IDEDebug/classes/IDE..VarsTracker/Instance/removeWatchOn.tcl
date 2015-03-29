IDE::VarsTracker instproc removeWatchOn var {
    my instvar watchList win
    set index [lsearch -exact $watchList $var]
    if {$index==-1} return
    set watchIndex [expr {$index+1}]
    destroy $win.name$watchIndex $win.var$watchIndex
    lset watchList $index {}
}
