IDE::DocGenerator instproc getInstMethodArguments {class p} {
    set arguments ""
    foreach arg [$class info instargs $p] {
        if {[$class info instdefault $p $arg val]} {
            # add variables (val)
            lappend arguments [list $arg $val]
        } else {
            lappend arguments $arg
        }
    }
    if {$::xotcl::version>=1.3} {
        if {[$class info instnonposargs $p] ne ""} {
            set arguments "[list [$class info instnonposargs $p]] [list $arguments]"
        }
    }
    return $arguments
}
