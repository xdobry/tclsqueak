IDEDBConnectDialog proc setConnectionOn {object {connectArgs {}}} {
    set inst [my new -connectionObject $object -connectArgs $connectArgs]
    $inst prompt
    if {[$inst set userAction] ne "cancel" && [$inst set userAction] ne ""} {
        $inst setConnectionToDB
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
