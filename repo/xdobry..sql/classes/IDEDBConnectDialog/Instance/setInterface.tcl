IDEDBConnectDialog instproc setInterface {} {
    my instvar interface connectionObject withSchemaExt
    set connectionClass [Sqlinterface loadInterface $interface]
    set connectionObject [$connectionClass new]
}
