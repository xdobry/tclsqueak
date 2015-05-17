IDE::MethodBrowser proc searchImplementorsAll {implementor {nocomplain 0}} {
    set list [IDE::CodeSearch searchImplementorsAll $implementor]
    if {[llength $list]>0} {
        my newBrowserList $list $implementor
    } else {
        if {!$nocomplain} {
            my emptySearchResult
        } else {
            return 0
        }
    }
    return 1
}
