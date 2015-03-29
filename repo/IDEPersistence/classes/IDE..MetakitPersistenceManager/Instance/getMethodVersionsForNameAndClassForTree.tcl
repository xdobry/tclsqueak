IDE::MetakitPersistenceManager instproc getMethodVersionsForNameAndClassForTree {name classname type} {
    set db [my getMetakitHandle]
    set res [list]
    foreach id [mk::select $db.Method -exact name $name -exact objectname $classname -exact type $type] {
        lappend res [linsert [mk::get $db.Method.$id basedon timest versioninfo userid] 1 $id]
    }
    my setLocalTimeFormat res 2
    return $res
}
