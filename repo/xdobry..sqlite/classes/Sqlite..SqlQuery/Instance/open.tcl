Sqlite::SqlQuery instproc open sqlstatement {
    my instvar result columns position length
    set columns {}
    set result {}
    set position 0
    [my set sqlhandle] eval $sqlstatement data {
        set row {}
        foreach column $data(*) {
            lappend row $data($column)
        }
        lappend result $row
    }
    if { [info exists data(*)] } {
        set columns $data(*)
    }
    set length [llength $result]
}
