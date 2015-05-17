IDE::MethodView instproc searchSenders range {
    my instvar vclass
    set text [my selectedItemFirst]
    if {$text ne ""} {
        set searchDict [my getSearchScopeDict $range]
        dict set searchDict text $text
        dict set searchDict type word
        my showSearchResult [IDE::CodeSearch search $searchDict]
    }
}
