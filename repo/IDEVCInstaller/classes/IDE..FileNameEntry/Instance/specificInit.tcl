IDE::FileNameEntry instproc specificInit {} {
    [self] instvar win
    ::button $win.button -text "..." -command [list [self] fileChooser]
    next
}
