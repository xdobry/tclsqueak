PrsCommandSubst instproc checkSyntax {context notifier} {
    next
    my instvar lastCommand
    if {[info exists lastCommand]} {
        my setType [$lastCommand getType]
    }
}
