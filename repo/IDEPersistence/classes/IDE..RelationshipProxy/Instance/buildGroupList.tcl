IDE::RelationshipProxy instproc buildGroupList {newList oldList} {
    set ret {}
    for {set i 0} {$i<[llength $newList]} {incr i} {
        set elem [lindex $newList $i]
        set oi [lsearch -exact $oldList $elem]
        set group {}
        for {set x $oi} {$x<[llength $oldList] && [lindex $newList $i]==[lindex $oldList $x]} {incr x; incr i} {
            lappend group [lindex $oldList $x]
        }
        incr i -1
        lappend ret $group
    }
    return $ret
}
