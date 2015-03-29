IDE::SqlBrowser instproc setNavigationEnablement {} {
    my instvar win historyIndex history
    if {$historyIndex>=0} {
        set state normal
    } else {
        set state disabled
    }
    $win.back configure -state $state
    if {$historyIndex<[expr {[llength $history]-1}]} {
        set state normal
    } else {
        set state disabled
    }
    $win.forward configure -state $state
}
