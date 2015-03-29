IDE::DBPersistence instproc getInsertValues columns_ref {
    upvar $columns_ref columns
    set tcols $columns
    set columns [list]
    set descriptor [my getDescriptor]
    set newvalues [list]
    foreach col $tcols {
        set value [$descriptor getValueForObject [self] $col]
        if {$value ne ""} {
            lappend columns $col
            lappend newvalues $value
        }
    }
    return $newvalues
}
