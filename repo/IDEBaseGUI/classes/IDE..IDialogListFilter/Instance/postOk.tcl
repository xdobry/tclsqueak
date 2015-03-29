IDE::IDialogListFilter instproc postOk {} {
    my instvar selected win
    set lw $win.listbox
    set sel [$lw curselection]
    if {[llength $sel]==0} {
        return
    }
    set selected [$lw get [lindex $sel 0]]
}
