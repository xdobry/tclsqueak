IDE::TclOOIntroProxy instproc getMethodParamDescForClass {class method} {
    if {![info object isa object $class] || ![info object isa class $class]} return
    set arguments [lindex [info class definition $class $method] 0]
    set defcount 0
    foreach arg $arguments {
        if {[llength $arg]>1} {
            incr defcount
        } else {
        }
    }
    list $arguments $defcount {}
}
