IDE::MetakitPersistenceManager instproc getMethodVersionsForNameAndClass {name classname} {
    set db [my getMetakitHandle]
    set res [list]
    foreach id [mk::select $db.Method -exact name $name -exact objectname $classname] {
        lappend res [linsert [mk::get $db.Method.$id timest versioninfo userid] 0 $id]
    }
    my setLocalTimeFormat res 1
    return $res
}
