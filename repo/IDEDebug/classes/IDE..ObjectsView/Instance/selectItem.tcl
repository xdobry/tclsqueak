IDE::ObjectsView instproc selectItem object {
    my instvar type
    if {$type eq "list"} {
        set proxy [IDE::XOIntroProxy getIntroProxyForObject $object]
        if {$proxy ne ""} {
            set locked [[my info parent] setViewObject $object $proxy]
            if {!$locked && [Object isobject [my info parent]::methodedit]} {
                if {[catch {$object printString} ps]} {
                    [my info parent]::methodedit setTextControler $object [self]
                } else {
                    [my info parent]::methodedit setTextControler $ps [self]
                }
            }
        } else {
            IDE::Dialog message "$object does not longer exist. It will be removed from the list"
            my removeItem $object
        }
    }
}
