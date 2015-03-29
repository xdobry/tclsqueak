IDE::TrackerBrowser proc openBrowser {} {
    if {![Object isobject ::ide_tracker_browser]} {
        return [my create ::ide_tracker_browser .tbrowser]
    }
}
