IDE::TclModeEdit instproc setText text {
    my instvar hasErrors
    set hasErrors 0
    next
    my syntaxHighlightIfWanted
}
