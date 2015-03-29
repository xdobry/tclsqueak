IDE::XOIntroProxy instproc getBodyTclMethod method {
    set arguments {}
    foreach arg [info args $method] {
        if {[info default $method $arg val]} {
            # add variables (val)
            lappend arguments [list $arg $val]
        } else {
            lappend arguments $arg
        }
    }
    return "proc [list $method] [list $arguments] \{[info body $method]\}\n"
}
