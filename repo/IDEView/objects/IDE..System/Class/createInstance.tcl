IDE::System proc createInstance class {
    if {![Object isclass $class]} { error "$class is not Xotcl Class"}
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
    set ret [IDE::IDialogEntry getValueWithCancel "Create instance of $class\n$def"]
    if {$ret eq "_cancel"} return
    if {$ret ne ""} {
       return [namespace eval :: $class create [Object autoname sample] $ret]
    } else {
       return [namespace eval :: [list $class create [Object autoname sample]]]
    }
}
