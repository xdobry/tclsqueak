IDE::NSIntroProxy instproc getProcBody p {
    my instvar currentNS
    set arguments {}
    set lambda {
        p  {
            set arguments {}
            set fp [namespace which $p]
            foreach arg [info args $fp] {
                if {[info default $fp $arg val]} {
                    # add variables (val)
                    lappend arguments [list $arg $val]
                } else {
                    lappend arguments $arg
                }
            }
            return "proc [list $p] [list $arguments] \{[info body $fp]\}\n"
        }
    }
    lappend lambda $currentNS
    my inspectEvalNs $currentNS [list apply $lambda $p]
}
