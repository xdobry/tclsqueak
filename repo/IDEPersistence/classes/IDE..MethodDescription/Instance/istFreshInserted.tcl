IDE::MethodDescription instproc istFreshInserted {} {
    my instvar timestamp
    expr {$timestamp eq "fresh-inserted"}
}
