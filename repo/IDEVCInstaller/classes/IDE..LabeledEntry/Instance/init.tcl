IDE::LabeledEntry instproc init window {
    [self] instvar win
    set win $window
    frame $win
    ::label $win.label -text [[self] label]
    ::entry $win.entry
    [self] specificInit
    [self] pack
}
