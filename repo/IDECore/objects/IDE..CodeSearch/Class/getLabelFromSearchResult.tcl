IDE::CodeSearch proc getLabelFromSearchResult searchResult {
    set type [dict get $searchResult type]
    set scope [dict get $searchResult scope]
    set label ""
    if {$type ne "text"} {
        append label $type " "
    }
    append label \" [dict get $searchResult text] \"
    if {$scope ne "all"} {
        append label " in: " [dict get $searchResult context]
    }
    return $label
}
