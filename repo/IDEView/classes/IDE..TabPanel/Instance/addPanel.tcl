IDE::TabPanel instproc addPanel panel {
    my instvar win panelTabid
    if {![catch {set panelTabid($panel)} tabid]} {
        $win select $tabid
        return
    }
    set panelWin [$panel getWindow]
    $win add $panelWin -text [$panel getTitle]
    $win select $panelWin
    set panelTabid($panel) $panelWin
}
