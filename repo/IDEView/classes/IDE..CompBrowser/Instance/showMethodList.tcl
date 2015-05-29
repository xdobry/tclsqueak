IDE::CompBrowser instproc showMethodList {} {
    my instvar win

    set toolPanel [my showToolPanel]
    #ttc vartype methodListView xotcl IDE::MethodListView
    set searchResultObj [self]::@searchresult
    if {![Object isobject $searchResultObj]} {
        IDE::SearchResultPanel create $searchResultObj $win.searchresult
    }
    $toolPanel addPanel $searchResultObj
}
