IDE::Component proc registerObject object {
    set component [package set component]
    if {$component eq "."} {
        set component [file rootname [file tail [info script]]]
    }
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    $introProxy moveToComponent $object $component
}
