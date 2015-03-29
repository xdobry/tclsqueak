IDE::CompBrowser instproc changeZoom {} {
    my instvar win sashpadYpos
    if {[winfo viewable $win.upperarea]} {
        $win.panedwindow forget $win.upperarea
        set sashpadYpos [lindex [$win.panedwindow proxy coord] 1]
    } else {
        $win.panedwindow add $win.upperarea -before $win.methodedit -height $sashpadYpos
    }
}
