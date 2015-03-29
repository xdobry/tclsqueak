IDE::RegexpBrowser instproc regexp:help:toggle {} {
    my instvar v_help data
    if {$v_help == 0} {
        pack forget $data(w:help)
    } else {
        pack $data(w:help) -before $data(w:regexp) -fill x -padx 5
    }
}
