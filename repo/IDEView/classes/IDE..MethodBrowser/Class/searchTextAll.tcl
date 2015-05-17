IDE::MethodBrowser proc searchTextAll {text {title {}}} {
    if {$title eq ""} {
        set title $text
    }
    my showSearchResult [IDE::CodeSearch searchTextAll $text]
}
