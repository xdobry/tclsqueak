IDE::TreeView instproc isValidSelection {} {
    my instvar win
    expr {[$win.listbox focus] ne ""}
}
