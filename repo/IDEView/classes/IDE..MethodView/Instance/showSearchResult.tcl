IDE::MethodView instproc showSearchResult searchResult {
    set local [expr {[[my info parent] hasclass IDE::CompBrowser]}]
    if {$local} {
        [my info parent] showSearchResult $searchResult
    } else {
        IDE::MethodBrowser showSearchResult $searchResult
    }
}
