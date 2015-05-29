IDE::SearchResultPanel instproc displaySearchResult searchResult {
    my instvar currentSearch methodview
    set currentSearch $searchResult
    set methodList [dict get $searchResult result]
    $methodview setList $methodList
    my displayMethodListLabel [IDE::CodeSearch getLabelFromSearchResult $searchResult]
}
