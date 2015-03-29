IDE::SQLPersistenceManager instproc maskstring value {
    if {$value eq "NULL"} { return NULL }
    return "'[[my getConnection] escape $value]'"
}
