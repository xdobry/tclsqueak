IDE::ClassDescription instproc setParameterReread parameter {
    set introProxy [my getCompIntroProxy]
    set object [my getObject]
    if {[$introProxy getParameterForClass $object] ne $parameter} {
        $introProxy setParameterForClass $object $parameter
    }
}
