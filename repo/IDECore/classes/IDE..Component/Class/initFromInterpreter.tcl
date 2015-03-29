IDE::Component proc initFromInterpreter {} {
    # build Allication Objects from metadata component tag by scaning all
    # classes
    set defaultComp [my getCompObjectForName default]
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    foreach class [$introProxy getClasses] {
        set compobj [$introProxy getCompObjectFor $class]
        if {[$compobj getName] eq "default" && [string match ::xotcl::* $class]} {
            $class setMetadata component core
            set compobj [$introProxy getCompObjectFor $class]
        }
        $compobj addClass $class
    }
    foreach object [$introProxy getObjects] {
        if {[namespace tail $object] ne "slot"} {
            [$introProxy getCompObjectFor $object] addObject $object
        }
    }
}
