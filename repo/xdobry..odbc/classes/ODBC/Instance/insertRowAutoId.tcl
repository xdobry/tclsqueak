ODBC instproc insertRowAutoId {table columns values {primarykey {}} {sequenzer {}}} {
    if {$sequenzer eq ""} {
        set sequenzer ${table}_seq
    }
    if {$primarykey eq ""} {
        set primarykey id
    }
    set idvalue [my getSequence $table]
    lappend columns $primarykey
    lappend values $idvalue
    my insertRow $table $columns $values
    return $idvalue
}
