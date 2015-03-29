IDE::LabeledEntry instproc getValue {} {
    [self] instvar win
    $win.entry get
}
