IDE::WikiScriptsBrowser instproc deleteInterp {} {
    if {[interp exists wiki]} {
        interp delete wiki
    } else {
        IDE::Dialog message "no interpeter"
    }
}
