Sqlite::SqlQueryNoMeta instproc open sqlstatement {
    my instvar result columns position length
    set columns {no-meta-information}
    set result {}
    set position 0
    set result [[my set sqlhandle] eval $sqlstatement]
    set length [llength $result]
}
