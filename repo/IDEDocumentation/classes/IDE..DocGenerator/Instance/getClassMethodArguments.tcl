IDE::DocGenerator instproc getClassMethodArguments {class p} {
    set arguments ""
    foreach arg [$class info args $p] {
        if {[$class info default $p $arg val]} {
            # add variables (val)
            lappend arguments [list $arg $val]
        } else {
            lappend arguments $arg
        }
    }
    if {$::xotcl::version>=1.3} {
        if {[$class info nonposargs $p] ne ""} {
            set arguments "[list [$class info nonposargs $p]] [list $arguments]"
        }
    }
    return $arguments
}
