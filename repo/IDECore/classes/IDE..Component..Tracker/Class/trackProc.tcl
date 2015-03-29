IDE::Component::Tracker proc trackProc args {
    set component [package set component]
    if {$component eq "."} {
        set component [file rootname [file tail [info script]]]
    }
    set name [lindex $args 0]
    my set methodsArr($name) $component
}
