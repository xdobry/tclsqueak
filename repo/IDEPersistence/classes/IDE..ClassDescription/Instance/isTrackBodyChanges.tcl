IDE::ClassDescription instproc isTrackBodyChanges {} {
    my instvar trackBodyChanges
    expr {![info exists trackBodyChanges] || $trackBodyChanges}
}
