IDE::WikiScriptsBrowser instproc setStatus status {
    my instvar win
    $win.status configure -text $status
    update idletask
}
