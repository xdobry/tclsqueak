IDE::IDialogList instproc setSelectedItem item {
    my instvar win list
    if {[set cur [lsearch -exact $list $item]]>=0} {
        $win.lframe.listbox selection set $cur $cur
        $win.lframe.listbox see $cur
    }
}
