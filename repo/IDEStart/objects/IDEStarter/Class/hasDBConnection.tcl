IDEStarter proc hasDBConnection {} {
    my instvar sqlhandle
    expr [info exists $sqlhandle] && [$sqlhandle isConnected]
}
