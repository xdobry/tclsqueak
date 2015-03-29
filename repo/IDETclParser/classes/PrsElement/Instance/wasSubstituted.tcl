PrsElement instproc wasSubstituted {} {
    my instvar operation
    expr {[info exists operation] && $operation eq "substitute"}
}
