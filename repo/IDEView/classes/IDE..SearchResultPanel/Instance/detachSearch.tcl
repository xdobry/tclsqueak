IDE::SearchResultPanel instproc detachSearch {} {
    my instvar currentSearch
    IDE::MethodBrowser showSearchResult $currentSearch
}
