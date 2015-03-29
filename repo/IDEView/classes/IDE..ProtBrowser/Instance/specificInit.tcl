IDE::ProtBrowser instproc specificInit {} {
    my instvar win
    IDE::ProtocolText create [self]::prottext $win.resulttext

    grid $win.resulttext -row 0 -column 0 -sticky news

    grid columnconfigure $win 0 -weight 1
    grid rowconfigure $win 0 -weight 1
    next
}
