IDE::SQLPersistenceManager instproc addRelationshipVeryBase {relation pdesc pid value {deforder {}}} {
    if {$deforder ne ""} {
        [my getConnection] execute "INSERT INTO [$relation relationTable] ([$relation sourceName],[$relation targetName],[$relation orderIndexName]) VALUES ($pid,$value,$deforder)"
    } else {
        if {[string is integer $value]} {
            [my getConnection] execute "INSERT INTO [$relation relationTable] ([$relation sourceName],[$relation targetName]) VALUES ($pid,$value)"
        } else {
            [my getConnection] execute "INSERT INTO [$relation relationTable] ([$relation sourceName],[$relation targetName]) VALUES ($pid,'$value')"
        }
    }
}
