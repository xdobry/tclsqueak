IDE::WikiScriptsBrowser instproc deleteInterp {} {
    my instvar win
    if {[interp exists wiki]} {
        interp delete wiki
        $win.nav.browse configure -state enabled
        $win.nav.delete configure -state enabled
    } else {
        IDE::Dialog message "no interpeter"
    }
}
