IDE::TrackedMethodList instproc browseSelected item {
    set first [lindex [split $item] 0]
    if {[Object isclass $first]} {
        IDE::HeritageBrowser newBrowser $first
    } elseif {[Object isobject $first]} {
        $first inspect
    } else {
        error "Unknown item type."
    }
}
