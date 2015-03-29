IDE::ObjectDescription instproc synchronizeMethods {} {
    my instvar objectid
    set objectname [my getObject]
    set rows [[my getPersistenceManager] selectSubobjects [self] {methodid} {name type}]
    foreach row $rows {
        set id [lindex $row 0]
        set name [lindex $row 1]
        set type [lindex $row 2]
        set mobj {}
        if {$type eq "Class"} {
            if {[$objectname info procs $name] eq ""} {
                puts stderr "Synchronize Problems method $name $type $id not found [my getName]"
            } else {
                set mobj [my getClassMethod $name]
            }
        } elseif {$type eq "Instance"} {
            if {[$objectname info instprocs $name] eq ""} {
                puts "Synchronize Problems method $name $type $id not found [my getName]"
            } else {
                set mobj [my getInstanceMethod $name]
            }
        }
        if {$mobj ne ""} {
            $mobj synchronizeWithId $id
        }
    }
}
