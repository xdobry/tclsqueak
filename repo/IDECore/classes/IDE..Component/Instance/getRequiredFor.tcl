IDE::Component instproc getRequiredFor {} {
    set name [my getName]
    set requiredFor [list]
    foreach cobj [IDE::Component getAllComponents] {
        if {$name in [$cobj getRequiredFrom]} {
            lappend requiredFor [$cobj getName]
        }
    }
    return $requiredFor
}
