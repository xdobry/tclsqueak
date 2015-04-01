IDE::WikiScriptsBrowser instproc loadWikiList {} {
    my instvar reaper wikiList
    my setStatus "loading wiki pages"
    set wikiList [$reaper getScriptList]
    foreach item $wikiList {
        lappend slist [lindex $item 0]
    }
    my @wikis setListUnsorted $slist
    my setStatus "list loaded"
}
