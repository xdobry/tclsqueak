IDE::LabeledEntry instproc pack {} {
    [self] instvar win
    pack $win.label $win.entry -side left
}
