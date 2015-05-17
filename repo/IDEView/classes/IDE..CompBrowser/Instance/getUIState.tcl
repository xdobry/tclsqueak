IDE::CompBrowser instproc getUIState {} {
    my instvar win
    set d [dict create create {IDE::CompBrowser newBrowser}]
    my addGeometryToState d $win
    set currentItem [[self]::methodview getCurrentItem]
    if {$currentItem ne ""} {
        dict set d currentItem $currentItem
    }
    return $d
}
