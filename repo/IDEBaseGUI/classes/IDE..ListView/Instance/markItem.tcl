IDE::ListView instproc markItem item {
    [self] instvar win listItems
    if {[set cur [lsearch -exact $listItems $item]]>=0} {
        $win.listbox itemconfigure $cur -foreground red -selectforeground red
    }
}
