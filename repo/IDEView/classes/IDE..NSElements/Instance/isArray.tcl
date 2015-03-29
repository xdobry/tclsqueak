IDE::NSElements instproc isArray {} {
    my instvar vtype vartype
    expr {[my isValidSelection] && $vtype eq "Vars" && $vartype eq "array"}
}
