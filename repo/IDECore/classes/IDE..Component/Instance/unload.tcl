IDE::Component instproc unload {} {
    my instvar objects classes
    set introProxy [my getIntroProxy]
    foreach class [concat $classes $objects] {
        $introProxy unloadObject $class
    }
    foreach sub [my info children] {
        if {[$sub istype IDE::ProcsGroup]} {
            $sub unload
        }
    }
    package forget [my getName]
    my destroy
}
