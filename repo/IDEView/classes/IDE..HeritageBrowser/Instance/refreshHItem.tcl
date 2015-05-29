IDE::HeritageBrowser instproc refreshHItem {hitem {notify 1}} {
    lassign $hitem vclass vctype method
    set atype [IDE::XOIntroProxy getAbstractMethodType $vctype]
    if {$atype eq "Def"} {
        [self]::hclassview setSelectedClass $vclass
    } else  {
        set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vctype]
        if {[$introProxy isObjectClass $vclass]} {
            set needState Classes
        } else {
            set needState Objects
        }
        [self]::hclassview refreshNavigation $vclass
        [self]::methodcatview stateButton changeStateTo $vctype
        [self]::methodcatview setSelectedItem _all_categories
        [self]::methodview setSelectedItem $method $notify
    }
}
