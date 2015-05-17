IDE::SearchResultPanel instproc displayMethodListLabel searchInfo {
    my instvar win
    $win.info configure -text $searchInfo
}
