IDE::NSElements instproc isInvokable {} {
    my instvar vtype
    expr {[my isValidSelection] && $vtype eq "Procs"}
}
