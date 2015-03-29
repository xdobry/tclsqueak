IDE::CompBrowser instproc refreshHItem hitem {
    puts "hitem $hitem"
    set vclass [lindex $hitem 0]
    set vctype [lindex $hitem 1]
    set method [lindex $hitem 2]
    if {$vctype eq "Procs"} {
        if {[Object isobject $vclass]} {
            set cobj [$vclass getComponent]
            [self]::appview setSelectedItem [$cobj getName]
            [self]::classview @stateButton changeStateTo "Procs"
            [self]::classview setSelectedItem [$vclass getName]
        }
    } else {
        set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vctype]
        set cobj [$introProxy getCompObjectFor $vclass]
        [self]::appview setSelectedItem [$cobj getName]
        if {[$introProxy isObjectClass $vclass]} {
            set needState Classes
        } else {
            set needState Objects
        }
        [self]::classview @stateButton changeStateTo $needState
        [self]::classview setSelectedItem $vclass
        [self]::methodcatview stateButton changeStateTo $vctype
        [self]::methodcatview setSelectedItem _all_categories
    }
}
