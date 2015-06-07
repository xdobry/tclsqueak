IDE::MethodBrowser proc searchTextAllDialog {{master IDE::MethodBrowser}} {
    set sel ""
    set w [focus]
    if {$w ne "" && [winfo class $w] eq "Text"} {
        set range [$w tag ranges sel]
        if {[llength $range]>0} {
            set sel [$w get [lindex $range 0] [lindex $range 1]]
        }
    }
    
    set search [IDE::CodeSearchDialog getSearch $master $sel [$master getContext]]
    if {$search ne ""} {
        $master showSearchResult [IDE::CodeSearch search $search]
    }
}
