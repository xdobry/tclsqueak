IDE::TclOOIntroProxy instproc getBodyInstanceSearchMethod {object ip} {
    # todo
    set arguments {}
    set p [$object procsearch $ip]
    foreach arg [info args $p] {
        if {[info default $p $arg val]} {
            # add variables (val)
            lappend arguments [list $arg $val]
        } else {
            lappend arguments $arg
        }
    }
    return "proc $p [list $arguments] \{[info body $p]\}\n"
}
