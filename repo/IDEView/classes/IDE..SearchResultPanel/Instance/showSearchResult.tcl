IDE::SearchResultPanel instproc showSearchResult searchResult {
    my instvar searchHistory
    lappend searchHistory $searchResult
    my displaySearchResult $searchResult
}
