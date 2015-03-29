IDE::MetakitPersistenceManager instproc getAditionalInfoForComponentId componentid {
    set db [my getMetakitHandle]
    set ret [list]
    foreach id [mk::select $db.Component!$componentid.ComponentObject] {
        set oid [mk::get $db.Component!$componentid.ComponentObject!$id objectid]
        lappend ret [mk::get $db.Object!$oid name versioninfo timest type]
    }
    my setLocalTimeFormat ret 2
    return $ret
}
