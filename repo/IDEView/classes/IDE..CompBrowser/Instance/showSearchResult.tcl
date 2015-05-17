IDE::CompBrowser instproc showSearchResult searchResult {
    if {[llength [dict get $searchResult result]]>0} {
        my showMethodList
        my @searchresult showSearchResult $searchResult
    } else {
        my setStatusBarText "no search result"
    }
}
