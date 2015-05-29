IDE::SearchResultPanel instproc history {} {
    my instvar searchHistory
    set items [list]
    foreach i $searchHistory {
        lappend items [IDE::CodeSearch getLabelFromSearchResult $i]
    }
    if {[llength $items]>0} {
        set idx [IDE::IDialogList getListIndex "select search" $items]
        if {$idx>=0} {
            my displaySearchResult [lindex $searchHistory $idx]
        }
    }
}
