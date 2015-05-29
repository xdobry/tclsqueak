IDE::MethodBrowser proc searchImplementorsAll {implementor {nocomplain 0}} {
    my showSearchResult [IDE::CodeSearch search [dict create text $implementor type implementors scope all]]
}
