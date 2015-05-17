IDE::CompBrowser instproc showMethodList {} {
    my instvar win

    set searchResultObj [self]::@searchresult
    #ttc vartype methodListView xotcl IDE::MethodListView
    if {![Object isobject $searchResultObj]} {
        IDE::SearchResultPanel create [self]::@searchresult $win.searchresult
    }
    if {![winfo viewable $win.searchresult]} {
        $win.lowerarea add $win.searchresult -width 250
    }

}
