IDE::SqlBrowser instproc executeCommand command {
    my instvar dbConnection win
    set result [$dbConnection execute $command]
    my set resultshow text
    my changeResultShow
    my clearTable
    if {$result eq ""} {
        [self]::@sqlresult setText [$dbConnection errorMessage]
    } else {
        [self]::@sqlresult setText "affected rows: $result"
        my addToHistory $command
    }
    
}
