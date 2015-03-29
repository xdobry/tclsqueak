IDE::IDialogListEntry instproc postOk {} {
    my instvar win selectedItem list entry
    if {[set cur [$win.lframe.listbox curselection]] ne ""} {
        set selectedItem [lindex $list $cur]
    }
    set entry [$win.entry get]
    next
}
