IDE::TrackerBrowser proc removeFromTrackList item {
    if {[Object isobject ::ide_tracker_browser]} {
        ::ide_tracker_browser::objectlist removeItem $item
    }
}
