IDEDBConnectDialog proc setConnectionOnExt {interface withSchemaExt {connectArgs {}} {writefile 0}} {
    set inst [my new -interface $interface -connectArgs $connectArgs -withSchemaExt $withSchemaExt -writefile $writefile]
    $inst prompt
    if {[$inst set userAction] ne "cancel" && [$inst set userAction] ne ""} {
        $inst setConnectionToDB
    } else {
        return 
    }
    set conn [$inst connectionObject]
    if {$conn eq "" || ![$conn isConnected]} {
        set msg empty
        if {$conn ne ""} {
            set msg [$conn errorMessage]
        }
        my tkMessage "DB count not be connected with message:\n$msg"
    }
    $inst destroy
    return $conn
}
