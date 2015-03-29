IDE::IDialogListChooser instproc postOk {} {
    my instvar listout
    set listout [my @listout getList]
    next
}
