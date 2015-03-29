IDE::TrackerBrowser proc addToProtocol text {
    if {[Object isobject ::ide_tracker_browser]} {
        ::ide_tracker_browser::protokol append $text
    }
}
