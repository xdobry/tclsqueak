IDE::XOIntroProxy instproc getMethodParamDescForClass {class instproc} {
    if {![Object isclass $class]} return
    set arguments [list]
    set defcount 0
    foreach arg [$class info instargs $instproc] {
        if {[$class info instdefault $instproc $arg val]} {
            incr defcount
            lappend arguments [list $arg $val]
        } else {
            lappend arguments $arg
        }
    }
    list $arguments $defcount [$class info instnonposargs $instproc]
}
