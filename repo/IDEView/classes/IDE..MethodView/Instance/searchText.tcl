IDE::MethodView instproc searchText range {
    set sel [[my info parent]::methodedit getSelection]
    set text [IDE::IDialogEntry getValue {give search text (regular expresion)} $sel search]
    if {$text ne ""} {
        set searchDict [my getSearchScopeDict $range]
        dict set searchDict text $text
        dict set searchDict type text
        my showSearchResult [IDE::CodeSearch search $searchDict]
    }
}
