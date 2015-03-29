IDE::ObjectDescription instproc rereadForAnotherVersion objectId {
    # Warning! no relationship in DB are set. see changeVersionTo
    if {![my questForChangeParent]} return
    my instvar objectid
    my trackingOff
    if {$objectid==$objectId} {
        IDE::Transcript warning "Reload Edition $objectId of [my getName]"
    } else {
        IDE::Transcript warning "Load Another Version $objectId of [my getName]"
    }
    foreach obj [my getMethodDescriptions] {
        if {[$obj getType] eq "Instance"} {
            set instanceMethodArr([$obj getName]) [list [$obj set methodid] $obj]
        } else {
            set classMethodArr([$obj getName]) [list [$obj set methodid] $obj]
        }
    }

    set objectid $objectId
    set anotherVersion [[my getPersistenceManager] selectSubobjects [self] {methodid} {name type}]

    foreach item $anotherVersion {
        set methodid [lindex $item 0]
        set name [lindex $item 1]
        set type [lindex $item 2]
        if {$type eq "Instance"} {
            if {[info exists instanceMethodArr($name)]} {
                if {[lindex $instanceMethodArr($name) 0]!=$methodid} {
                    [lindex $instanceMethodArr($name) 1] rereadForAnotherVersion $methodid
                }
                unset instanceMethodArr($name)
            } else {
                my loadMethod $methodid
            }
        } else {
            if {[info exists classMethodArr($name)]} {
                if {[lindex $classMethodArr($name) 0]!=$methodid} {
                    [lindex $classMethodArr($name) 1] rereadForAnotherVersion $methodid
                }
                unset classMethodArr($name)
            } else {
                my loadMethod $methodid
            }
        }
    }
    foreach typ {instance class} {
        if {[array exists ${typ}MethodArr]} {
            for {set sid [array startsearch ${typ}MethodArr]} {[array anymore ${typ}MethodArr $sid]} {} {
                set robj [array nextelement ${typ}MethodArr $sid]
                set robj [lindex [set ${typ}MethodArr($robj)] 1]
                $robj undefine
                $robj destroy
            }
            array donesearch ${typ}MethodArr $sid
        }
    }
    my rereadAttributes {basedon versioninfo timest isclosed userid infoid defbody}
    my trackingOn
}
