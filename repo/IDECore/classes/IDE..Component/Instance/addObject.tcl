IDE::Component instproc addObject object {
    # use $object moveToComponent name for right initialisation
    # this is private only
    my instvar objects name
    set ns [[my getIntroProxy] getObjectNamespace $object]
    if {$ns ne [my getNamespace] && $name ni {core default}} {
        error "component accept only objects in '[my getNamespace]' namespace for $object"
    }
    ::ide::lappendIfNone objects [string trimleft $object :]
}
