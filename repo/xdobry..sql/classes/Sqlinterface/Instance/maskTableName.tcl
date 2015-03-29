Sqlinterface instproc maskTableName tableName {
    if {[string first " " $tableName]>=0} {
        return "\[$tableName\]" 
    }
    return $tableName
}
