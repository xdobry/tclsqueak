IDE::VarsTracker instproc removeAllWatches {} {
    my instvar watchList
    foreach var $watchList {
        if {$var ne ""} {
            IDE::VarsTracker removeTrace $var watch
        }
    }
}
