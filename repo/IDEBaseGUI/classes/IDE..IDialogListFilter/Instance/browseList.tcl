IDE::IDialogListFilter instproc browseList {} {
    my instvar win pattern candidates
    set lw $win.listbox
    focus $lw
}
