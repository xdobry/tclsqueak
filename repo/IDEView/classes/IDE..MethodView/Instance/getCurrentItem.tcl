IDE::MethodView instproc getCurrentItem {} {
    my instvar actItem
    if {[info exists actItem]} {
        return $actItem
    }
    return
}
