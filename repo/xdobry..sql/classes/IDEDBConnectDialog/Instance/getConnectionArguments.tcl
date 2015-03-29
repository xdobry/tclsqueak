IDEDBConnectDialog instproc getConnectionArguments {} {
    my instvar connectionObject win frame connectArgs writefile
    set cframe [IDEDBConnectFrame new -childof [self] -connectionObject $connectionObject -win $frame.con -connectArgs $connectArgs -writefile $writefile]
    pack $frame.con
    my suspendUntilSignal
    my connectArgs [$cframe getConnectArgs]
}
