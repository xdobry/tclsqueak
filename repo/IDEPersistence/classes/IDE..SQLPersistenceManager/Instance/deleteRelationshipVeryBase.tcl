IDE::SQLPersistenceManager instproc deleteRelationshipVeryBase {relation pdesc pid value} {
    if {[string is integer $value]} {
       [my getConnection] execute "DELETE from [$relation relationTable] WHERE [$relation sourceName]=$pid AND [$relation targetName]=$value"
    } else {
       [my getConnection] execute "DELETE from [$relation relationTable] WHERE [$relation sourceName]=$pid AND [$relation targetName]='$value'"
    }
}
