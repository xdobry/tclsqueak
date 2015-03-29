IDE::ListView instproc removeSelection {first last} {
    my instvar win
    $win.listbox selection clear $first $last
}
