IDE::Component instproc getVersionNumber {} {
    my instvar version
    if {[info exists version]} {
        return $version
    }
    return 1.0
}
