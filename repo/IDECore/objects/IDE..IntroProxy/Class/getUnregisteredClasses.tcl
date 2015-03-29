IDE::IntroProxy proc getUnregisteredClasses {} {
    set dcomp [IDE::Component getCompObjectForName default]
    set dcompClasses [$dcomp getClasses]
    set ret {}
    foreach cls [my getClasses] {
        set cobj [$cls getCompObject]
        if {$cobj eq $dcomp && $cls ni $dcompClasses} {
            lappend ret $cls
        }
    }
    return $ret
}
