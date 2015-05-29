IDE::CompBrowser instproc refreshHItem {hitem {notify 1}} {
    lassign $hitem vclass vctype method
    set atype [IDE::XOIntroProxy getAbstractMethodType $vctype]
    if {$atype eq "Procs"} {
        if {[Object isobject $vclass]} {
            set cobj [$vclass getComponent]
            [self]::@compview refreshNavigation [$cobj getName]
            [self]::classview @stateButton changeStateTo "Procs"
            [self]::classview refreshNavigation [$vclass getName]
            [self]::methodview setSelectedItem $method $notify
        }
    } elseif {$vctype eq "Component"} {
        if {$notify} {
            [self]::@compview setSelectedItem $vclass $notify
        } else {
            [self]::@compview refreshNavigation $vclass
        }
    } elseif {[string range $vctype end-9 end] eq "ProcsGroup"} {
        set component $method
        set cobj [IDE::Component getCompObjectForNameIfExist $component]
        if {$cobj ne ""} {
            [self]::@compview refreshNavigation $component
            [self]::classview @stateButton changeStateTo Procs
            [self]::classview refreshNavigation [$vclass getName]
        }
    } elseif {$atype eq "Def"} {
        set component $method
        set cobj [IDE::Component getCompObjectForNameIfExist $component]
        if {$cobj ne ""} {
            [self]::@compview refreshNavigation $component
            set introProxy [$cobj getIntroProxy]
            if {[$introProxy isObjectClass $vclass]} {
                [self]::classview @stateButton changeStateTo Classes
            } else {
                [self]::classview @stateButton changeStateTo Objects
            }
            if {$notify} {
                [self]::classview setSelectedItem $vclass $notify                           } else {
                [self]::classview refreshNavigation $vclass
            }
        }
    } else  {
        set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vctype]
        set cobj [$introProxy getCompObjectFor $vclass]
        [self]::@compview refreshNavigation [$cobj getName]
        if {[$introProxy isObjectClass $vclass]} {
            set needState Classes
        } else {
            set needState Objects
        }
        [self]::classview @stateButton changeStateTo $needState
        [self]::classview refreshNavigation $vclass
        [self]::methodcatview stateButton changeStateTo $vctype
        [self]::methodcatview setSelectedItem _all_categories
        [self]::methodview setSelectedItem $method $notify
    }
}
