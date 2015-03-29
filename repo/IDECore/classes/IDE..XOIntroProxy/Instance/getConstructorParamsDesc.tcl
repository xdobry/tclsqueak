IDE::XOIntroProxy instproc getConstructorParamsDesc class {
    set arguments {}
    if {[$class info instprocs init] ne ""} {
        foreach arg [$class info instargs init] {
           if {[$class info instdefault init $arg val]} {
              lappend arguments [list $arg $val]
              } else {
              lappend arguments $arg
           }
        }
    }
    set parameters {}
    foreach par [$class info parameter] {
         lappend parameters -[lindex $par 0]
    }
    set def ""
    if {[llength $arguments]>0} {
        append def "init args: $arguments\n"
    }
    append def "params: $parameters"
    return $def
}
