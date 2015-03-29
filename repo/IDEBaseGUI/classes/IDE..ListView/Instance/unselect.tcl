IDE::ListView instproc unselect {} {
    my instvar win
    $win.listbox selection clear 0 end
}
