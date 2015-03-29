IDE::XOIntroProxy instproc getUnregisteredClasses {} {
    set dcomp [IDE::Component getCompObjectForName default]
    set dcompClasses [$dcomp getClasses]
    set ret {}
    foreach cls [my getClasses] {
        set cobj [my getCompObjectFor $cls]
        if {$cobj eq $dcomp && $cls ni $dcompClasses} {
            lappend ret $cls
        }
    }
    return $ret
}
