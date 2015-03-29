IDE::TclProcsDescription instproc getCompIntroProxy {} {
    my instvar introProxy
    if {![info exists introProxy]} {
        set introProxy [IDE::XOIntroProxy getIntroProxy]
    }
    return $introProxy
}
