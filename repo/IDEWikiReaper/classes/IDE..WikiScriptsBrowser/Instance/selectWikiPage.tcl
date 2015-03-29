IDE::WikiScriptsBrowser instproc selectWikiPage dummy {
    my instvar wikiList win
    set id [my @wikis selectedIndex]
    if {$id ne ""} {
        $win.nav.page delete 0 end
        $win.nav.page insert 0 [lindex $wikiList $id 1]
    }
}
