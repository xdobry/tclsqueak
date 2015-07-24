IDE::Deployer instproc checkComponentRequirements {} {
    my instvar desc
    set components [dict get $desc components]
    set required [list]
    foreach c $components {
        set cobj [IDE::Component getCompObjectForNameIfExist $c]
        if {$cobj eq ""} {
            error "can not find component with name $c"
        }
        foreach r [$cobj getRequiredFromDeep] {
            if {$r ni $components && $r ni $required && [IDE::Component getCompObjectForNameIfExist $r] ne ""} {
                lappend required $r
            }
        }
    }
    if {[llength $required]>0} {
        lappend components {*}$required
        dict set desc components [IDE::Component orderComponents $components]
    }
}
