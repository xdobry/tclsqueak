IDE::ListView instproc addSelection {first last} {
    my instvar win
    $win.listbox selection set $first $last
}
