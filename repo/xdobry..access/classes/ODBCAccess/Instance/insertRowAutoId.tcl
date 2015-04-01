ODBCAccess instproc insertRowAutoId {table columns values {primarykey {}} {sequenzer {}}} {
    my insertRow $table $columns $values
    my getinsertid
}
