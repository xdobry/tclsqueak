IDE::MetakitPersistenceManager instproc getVersionsForName {name cols desc {descorder 1}} {
    set sqlcols [list]
    set hasuser 0
    foreach c $cols {
        if {$c eq "username"} {
            lappend sqlcols userid
            set hasuser 1
        } else {
            lappend sqlcols $c
        }
    }
    set rez [list]
    set db [my getMetakitHandle]
    foreach id [mk::select $db.[$desc table] -exact name $name] {
        lappend rez [linsert [eval mk::get $db.[$desc table]!$id $sqlcols] 0 $id]
    }
    if {$descorder} {
        set res [list]
        for {set i [llength $rez]} {$i>0} {} {
            lappend res [lindex $rez [incr i -1]]
        }
        set rez $res
    }
    set tid [lsearch $cols timest]
    if {$tid>=0} {
	my setLocalTimeFormat rez [expr {$tid+1}]
    }
    return $rez
}
