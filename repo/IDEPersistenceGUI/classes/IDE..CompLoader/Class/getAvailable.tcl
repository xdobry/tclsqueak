IDE::CompLoader proc getAvailable {} {
    set loaded [IDE::Component getComponentNames]
    set open [list]
    set available [IDE::ComponentPersistence getAvailable]
    foreach a $available {
        if {$a ni $loaded} {
            lappend open $a
        }
    }
    return $open
}
