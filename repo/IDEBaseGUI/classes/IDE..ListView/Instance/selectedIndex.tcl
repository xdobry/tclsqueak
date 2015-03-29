IDE::ListView instproc selectedIndex {} {
    my instvar win
    $win.listbox curselection
}
