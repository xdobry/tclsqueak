IDE::SQLPersistenceManager instproc getSubobjectIndexesForIdBase {desc relation id} {
    set sql "SELECT [$relation targetName] from [$relation relationTable] where [$relation sourceName]=$id"
    set query [[my getConnection] query $sql]
    set ret {}
    while {[llength [set row [$query fetch]]]>0} {
        lappend ret [lindex $row 0]
    }
    $query destroy
    return $ret
}
