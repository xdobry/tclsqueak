IDE::MethodBrowser proc searchImplementorsDialog {{master IDE::MethodBrowser}} {
    set implementor [IDE::MethodSelector getMethod]
    if {$implementor eq ""} return
    $master showSearchResult [IDE::CodeSearch search [dict create text $implementor type implementors scope all]]
}
