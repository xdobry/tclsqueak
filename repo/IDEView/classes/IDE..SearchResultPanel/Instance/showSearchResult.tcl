IDE::SearchResultPanel instproc showSearchResult searchResult {
    my instvar currentSearch
    set currentSearch $searchResult
    set methodList [dict get $searchResult result]
    [my info parent] @methodlist setList $methodList
    my displayMethodListLabel [IDE::CodeSearch getLabelFromSearchResult $searchResult]
}
