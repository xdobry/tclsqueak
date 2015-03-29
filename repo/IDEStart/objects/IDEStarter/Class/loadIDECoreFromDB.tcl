IDEStarter proc loadIDECoreFromDB {} {
    foreach comp [my coreComponents] {
        if {[llength $comp]>1} {
            my loadComponent [lindex $comp 0] [lindex $comp 1]
        } else {
            my loadComponent $comp
        }
    }
}
