IDE::IntroProxy proc getProcBody p {
     set arguments {}
     foreach arg [::info args $p] {
         if {[::info default $p $arg val]} {
             # add variables (val)
             lappend arguments [list $arg $val]
         } else {
             lappend arguments $arg
         }
     }
    return "proc [list $p] [list $arguments] \{[::info body $p]\}\n"
}
