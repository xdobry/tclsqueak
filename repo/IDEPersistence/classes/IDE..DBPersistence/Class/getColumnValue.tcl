IDE::DBPersistence proc getColumnValue {columns values column} {
    set id [lsearch $columns $column]
    if {$id<0} { error "wrong table descriptior can not find $column in [list $columns]" }
    lindex $values $id
}
