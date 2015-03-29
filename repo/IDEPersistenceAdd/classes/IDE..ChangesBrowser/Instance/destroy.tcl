IDE::ChangesBrowser instproc destroy {} {
    my instvar comp1 comp2 obj1 obj2 mode
    if {$mode eq "components"} {
        if {[info exists comp1]} {
            if {[$comp1 istype IDE::ComponentEdition]} {$comp1 destroy}
            if {[$comp2 istype IDE::ComponentEdition]} {$comp2 destroy}
        }
    } else {
        if {[info exists obj1] && [$obj1 istype IDE::ObjectEdition]} {$obj1 destroy}
        if {[info exists obj1] && [$obj2 istype IDE::ObjectEdition]} {$obj2 destroy}
    }
    next
}
