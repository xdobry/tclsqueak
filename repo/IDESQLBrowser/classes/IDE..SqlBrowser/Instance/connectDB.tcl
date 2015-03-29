IDE::SqlBrowser instproc connectDB {} {
    my instvar dbConnection win
    my disconnectDB
    set dbConnection [IDEDBConnectDialog setConnectionOn {}]
    if {[my isConnectedDB]} {
        $win.connectionlab configure -text "connected [$dbConnection set interface] - [$dbConnection set dbank]"
        my refreshTables
        $win.run configure -state normal
    }
}
