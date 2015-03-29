IDE::RepositoryImporter instproc connectRepository {} {
    my instvar exportRepository win
    my disconnectRepository
    set exportRepository [IDEDBConnectDialog setConnectionOn {}]
    if {[my isConnectedRepository]} {
        $win.connectionlab configure -text "connected [$exportRepository set interface] - [$exportRepository set dbank]"
        my refreshImportConfigmap
    }
}
