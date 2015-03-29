IDE::Text instproc getSelection {} {
    my instvar win
    set range [$win.text tag ranges sel]
    if {[llength $range]==0} return
    return [$win.text get [lindex $range 0] [lindex $range 1]]
}
