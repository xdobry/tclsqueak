IDE::Component instproc addClass class {
    # use $object moveToComponent name for right initialization
    # this is private only
    my instvar classes name
    set ns [[my getIntroProxy] getObjectNamespace $class]
    if {$ns ne [my getNamespace] && $name ni {core default}} {
        error "component accept only classes in '[my getNamespace]' namespace for class $class"
    }
    ::ide::lappendIfNone classes [IDE::XOIntroProxy normalizeName $class]
}
