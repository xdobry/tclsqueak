IDE::MethodBrowser proc searchBreakPoints {{master IDE::methodBrowser}} {
    $master showSearchResult [IDE::CodeSearch searchTextAll {([^#]\[self\]|[^#]my) halt}]
}
