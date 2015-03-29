IDE::ComponentPersistence instproc rereadForAnotherVersion componentId {
    # !!! don't forget to implement requirements changes
    my instvar componentid isclosed
    # prohibite to make new edtion by versioned components
    # caused by ${name}::description rereadForAnotherVersion
    set isclosed 0
    if {$componentid==$componentId} {
        IDE::Transcript warning "Reload Edition $componentId of [my getName]"
    } else {
        IDE::Transcript warning "Load Another Version $componentId of [my getName]"
    }
    set introProxy [my getIntroProxy]
    foreach obj [concat [my getObjects] [my getClasses] [my getProcsGroupsObjects]] {
        set desc [$introProxy getDescriptionForObject $obj]
        set objArr([$desc getObjectName]) $desc
    }

    set componentid $componentId
    set anotherVersion [[my getPersistenceManager] selectSubobjects [self] {objectid deforder} {name type}]

    foreach item $anotherVersion {
        set objectid [lindex $item 0]
        set deforder [lindex $item 1]
        set name [lindex $item 2]
        if {[info exists objArr($name)]} {
            set desc $objArr($name)
            if {[$desc set objectid]!=$objectid} {
                $desc rereadForAnotherVersion $objectid
            } else {
                $desc reloadEdition
            }
            $desc set deforder $deforder
            unset objArr($name)
        } else {
            set obj [my loadObject $objectid]
            $obj set deforder $deforder
        }
    }
    if {[info exists objArr]} {
        for {set sid [array startsearch objArr]} {[array anymore objArr $sid]} {} {
            set name [array nextelement objArr $sid]
            set desc $objArr($name)
            if {[$desc istype IDE::ProcsGroup]} {
                my basicRemoveProcsGroup $desc
            } else {
                my basicRemoveObject $name
                $name destroy
            }
        }
        array donesearch objArr $sid
    }
    my rereadAttributes {basedon versioninfo timest isclosed defcounter userid infoid}
}
