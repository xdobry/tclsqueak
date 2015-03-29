IDE::TkWinConfList instproc fillMenuStruct ms {
    my requireNamespace
    my set ignoreDefaults 0
    $ms addCheckButton {Ingnore defualts by _all} [self]::ignoreDefaults {}
    next
}
