IDE::ProcsGroupPer instproc rereadForAnotherVersion objectId {
    if {![my questForChangeParent]} return
    my instvar objectid
    my trackingOff
    if {$objectid==$objectId} {
        IDE::Transcript warning "Reload Edition $objectId of [my getName]"
    } else {
        IDE::Transcript warning "Load Another Version $objectId of [my getName]"
    }
    foreach obj [my getMethodDescriptions] {
        set methodArr([$obj getName]) [list [$obj set methodid] $obj]
    }

    set anotherVersion [[my getPersistenceManager] selectSubobjects [self] {methodid} {name type}]
    foreach item $anotherVersion {
        set methodid [lindex $item 0]
        set name [lindex $item 1]
        if {[info exists methodArr($name)]} {
            if {[lindex $methodArr($name) 0]!=$methodid} {
                [lindex $methodArr($name) 1] rereadForAnotherVersion $methodid
            }
            unset methodArr($name)
        } else {
            my loadMethod $methodid
        }
    }
    if {[array exists methodArr]} {
        for {set sid [array startsearch methodArr]} {[array anymore methodArr $sid]} {} {
            set robj [array nextelement methodArr $sid]
            set robj [lindex $methodArr($robj) 1]
            $robj undefine
            $robj destroy
        }
        array donesearch methodArr $sid
    }
    set objectid $objectId
    my rereadAttributes {basedon versioninfo timest isclosed userid infoid}
    my rereadDefinition
    my trackingOn
}
