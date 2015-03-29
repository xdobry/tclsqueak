IDE::SQLPersistenceManager instproc copyRelationships {obj basedon} {
    set desc [$obj getDescriptor]
    set id [$obj getIdValue]
    set relation [$desc set weakRelationship]
    if {[$relation exists orderIndexName]} {
        set query [[my getConnection] query "SELECT [$relation targetName],[$relation orderIndexName] from [$relation relationTable] where [$relation sourceName]=$basedon"]
        while {[llength [set row [$query fetch]]]>0} {
            set tid [lindex $row 0]
            set order [lindex $row 1]
            [my getConnection] execute "INSERT INTO [$relation relationTable] ([$relation sourceName],[$relation targetName],[$relation orderIndexName]) VALUES ($id,$tid,$order)"
        }
        $query destroy
    } else {
        set query [[my getConnection] query "SELECT [$relation targetName] from [$relation relationTable] where [$relation sourceName]=$basedon"]
        while {[llength [set row [$query fetch]]]>0} {
            set tid [lindex $row 0]
            [my getConnection] execute "INSERT INTO [$relation relationTable] ([$relation sourceName],[$relation targetName]) VALUES ($id,$tid)"
        }
        $query destroy
    }
}
