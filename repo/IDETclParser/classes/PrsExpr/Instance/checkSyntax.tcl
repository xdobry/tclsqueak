PrsExpr instproc checkSyntax {context notifier} {
    my instvar perror
    if {[info exists perror]} {
        foreach e $perror {
            $notifier addError [lindex $e 1] [lindex $e 0]
        }
    }
}
