IDE::MethodBrowser proc showSearchResult searchResult {
    if {[dict get $searchResult result]>0} {
        set obj [my newBrowserList [dict get $searchResult result] [IDE::CodeSearch getLabelFromSearchResult $searchResult]]
        $obj setSearchString [dict get $searchResult text]
    } else {
        my emptySearchResult
    }
}
