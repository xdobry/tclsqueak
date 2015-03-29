IDE::DBMapping instproc checkSchema {} {
    set connection [IDE::DBPersistence getConnection]
    if {[lsearch -exact [$connection getTables] [my table]]>=0} return
    set sql "CREATE TABLE [my table] (\n"
    append sql " [my idColumn] int DEFAULT '0' NOT NULL auto_increment,\n"
    foreach coldef [my set columns] {
        append sql " [lindex $coldef 0] [lindex $coldef 1],\n"
    }
    append sql " PRIMARY KEY ([my idColumn])\n)"
    $connection execute $sql
    if {[my exists relationships]} {
        foreach rel [my set relationships] {
            $rel checkSchema
        }
    }
}
