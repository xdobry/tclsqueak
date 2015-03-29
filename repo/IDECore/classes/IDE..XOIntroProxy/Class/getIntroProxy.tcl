IDE::XOIntroProxy proc getIntroProxy {} {
    my instvar proxy
    if {![info exists proxy] || ![Object isobject $proxy]} {
        set proxy [IDE::XOIntroProxy new]
    }
    return $proxy
}
