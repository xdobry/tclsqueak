IDE::DBMapping instproc getColumns {} {
    my instvar columns
    set col [list]
    foreach c $columns {
        lappend col [lindex $c 0]
    }
    return $col
}
