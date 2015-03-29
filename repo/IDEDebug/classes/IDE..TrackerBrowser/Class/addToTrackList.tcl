IDE::TrackerBrowser proc addToTrackList item {
    if {[Object isobject ::ide_tracker_browser]} {
        ::ide_tracker_browser::objectlist addItem $item
    }
}
