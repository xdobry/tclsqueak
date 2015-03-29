IDE::IntroProxy proc getComponentsNoIDE {} {
    set ideComps [concat [IDE::System getCoreComponents] [IDE::System getExtraComponents]]
    set ret {}
    foreach comp [IDE::Component getComponentNames] {
        if {$comp ni $ideComps} {
            lappend ret $comp
        }
    }
    return $ret
}
