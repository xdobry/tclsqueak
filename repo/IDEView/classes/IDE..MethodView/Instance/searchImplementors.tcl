IDE::MethodView instproc searchImplementors range {
    my instvar vclass
    set implementor [my selectedItemFirst]
    if {$implementor ne ""} {
        set searchDict [my getSearchScopeDict $range]
        dict set searchDict text $implementor
        dict set searchDict type implementors
        my showSearchResult [IDE::CodeSearch search $searchDict]
    }
}
