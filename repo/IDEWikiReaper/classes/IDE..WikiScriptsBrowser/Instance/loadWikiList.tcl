IDE::WikiScriptsBrowser instproc loadWikiList {} {
    my instvar reaper wikiList
    set wikiList [$reaper getScriptList]
    foreach item $wikiList {
        lappend slist [lindex $item 0]
    }
    my @wikis setListUnsorted $slist
}
