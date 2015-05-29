IDE::SearchResultPanel instproc refresh {} {
    my instvar currentSearch
    if {$currentSearch ne ""} {
        my displaySearchResult $currentSearch
    }
}
