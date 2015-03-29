IDE::RegexpBrowser instproc destroy {} {
    my instvar win historyWin
    ::destroy $win
    ::destroy $historyWin
    next
}
