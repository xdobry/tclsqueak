IDE::SpawnMethodEdit instproc specificInit {} {
    my instvar win
    IDE::TclModeEdit create [self]::methodedit $win.methodedit
    pack $win.methodedit -fill both -expand yes
}
