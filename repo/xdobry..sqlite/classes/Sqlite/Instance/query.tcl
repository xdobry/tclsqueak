Sqlite instproc query sqlstatement {
    my instvar noMeta
    # if {$noMeta}
    # the sqlite interface sucks !!!
    # the is no possibility to get same named columns row by row in general way
    if {0} {
        set statement [Sqlite::SqlQueryNoMeta new -sqlhandle [my set sqlhandle]]
    } else {
        set statement [Sqlite::SqlQuery new -sqlhandle [my set sqlhandle]]
    }
    if { [catch {$statement open $sqlstatement} err] } {
        my errorMessage $err
        destroy $statement
        return
    } else {
        return $statement
    }
}
