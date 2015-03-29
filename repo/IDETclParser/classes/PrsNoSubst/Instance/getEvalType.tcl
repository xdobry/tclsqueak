PrsNoSubst instproc getEvalType {} {
    my instvar lastCommand
    if {[info exists lastCommand]} {
        return [$lastCommand getType]
    }
    return void
}
