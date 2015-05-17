IDE::CompBrowser instproc closeSearchResult {} {
    my instvar win
    if {[winfo viewable $win.searchresult]} {
        $win.lowerarea forget $win.searchresult
    }
}
