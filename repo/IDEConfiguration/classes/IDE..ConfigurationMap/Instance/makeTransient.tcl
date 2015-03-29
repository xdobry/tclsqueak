IDE::ConfigurationMap instproc makeTransient {} {
    my setCMaps {}
    my setComponents {}
    [self]::components updateList
    [self]::childconigmaps updateList
    next
}
