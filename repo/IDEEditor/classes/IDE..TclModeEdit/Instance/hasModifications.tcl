IDE::TclModeEdit instproc hasModifications {} {
    my instvar hasErrors
    expr {$hasErrors || [next]}
}
