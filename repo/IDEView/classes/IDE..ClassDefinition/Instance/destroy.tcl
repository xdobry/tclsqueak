IDE::ClassDefinition instproc destroy {} {
    my instvar win
    ::destroy $win
    next
}
