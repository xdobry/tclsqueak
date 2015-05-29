IDE::IDialogList instproc postOk {} {
    my instvar win selectedItem list selectedIndex
    if {[set cur [$win.lframe.listbox curselection]] ne ""} {
        set selectedItem [lindex $list $cur]
        set selectedIndex $cur
    }
    next
}
