IDE::MethodSelector proc getMethod {} {
    set mlist [my getMethodsForPattern *]
    IDE::IDialogListFilter selectFromList {Choose the method} $mlist
}
