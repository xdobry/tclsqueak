IDE::ProcsGroupPer instproc synchronizeMethods {} {
    my instvar objectid

    set rows [[my getPersistenceManager] selectSubobjects [self] {methodid} {name type}]
    foreach row $rows {
        lassign $row id name type
        if {$type ne "tclproc"} {
            puts stderr "Problem by synchronize. Expect tcl proc by tcl group $name (type:$type) -$row"
            continue
        }
        set mobj [my getProcObjForNameIfExist $name]
        if {$type ne "tclproc"} {
            puts stderr "Problem by synchronize. Expected $name in tcl proc group was not found"
            continue
        }
        if {$mobj eq ""} {
            if {[namespace eval :: [list info procs $name]] eq ""} {
                puts stderr "Expected proc $name not found"
                continue
            } else {
                set mobj [my getProcObjForName $name]
            }
        }
        IDE::TclProcsDescriptionPer synchronize $mobj $id
    }
}
