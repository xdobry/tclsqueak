IDE::IDialogList instproc postOk {} {
    my instvar win selectedItem list
    if {[set cur [$win.lframe.listbox curselection]] ne ""} {
        set selectedItem [lindex $list $cur]
    }
    next
}
