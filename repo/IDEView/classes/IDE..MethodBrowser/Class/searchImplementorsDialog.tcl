IDE::MethodBrowser proc searchImplementorsDialog {} {
    set ret [IDE::MethodSelector getMethod]
    if {$ret eq ""} return
    my searchImplementorsAll $ret
}
