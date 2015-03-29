IDE::ProcsGroupPer instproc synchronizeMethods {} {
    my instvar objectid
    
    set rows [[my getPersistenceManager] selectSubobjects [self] {methodid} {name type}]
    foreach row $rows {
        set id [lindex $row 0]
        set name [lindex $row 1]
        set type [lindex $row 2]
        if {$type ne "tclproc"} {
            puts stderr "Problem by synchronize. Expect tcl proc by tcl group"
            continue
        } 
        set mobj [my getProcObjForNameIfExist $name]
        if {$type ne "tclproc"} {
            puts stderr "Problem by synchronize. Expected $name in tcl proc group was not found"
            continue
        } 
        IDE::TclProcsDescriptionPer synchronize $mobj $id
    }
}
