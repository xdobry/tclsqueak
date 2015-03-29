IDE::WikiScriptsBrowser instproc browseInterp {} {
    if {[interp exists wiki]} {
        IDE::NSBrowser newBrowserForInterp wiki
    } else {
        IDE::Dialog message "no interpreter exists"
    }
}
