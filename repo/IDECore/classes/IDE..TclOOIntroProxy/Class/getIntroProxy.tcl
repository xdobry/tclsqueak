IDE::TclOOIntroProxy proc getIntroProxy {} {
    my instvar proxy
    if {![info exists proxy] || ![Object isobject $proxy]} {
        set proxy [IDE::TclOOIntroProxy new]
        oo::define oo::object export eval
    }
    return $proxy
}
