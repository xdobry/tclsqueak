IDE::DocGenerator instproc getProcArguments p {
    set arguments ""
    foreach arg [::info args $p] {
        if {[::info default $p $arg val]} {
            # add variables (val)
            lappend arguments [list $arg $val]
        } else {
            lappend arguments $arg
        }
    }
    return $arguments
}
