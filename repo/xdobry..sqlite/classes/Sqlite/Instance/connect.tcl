Sqlite instproc connect par_list {
    array set par_array $par_list
    set sqlhandle [Object autoname sqlite]
    if {[catch {sqlite $sqlhandle $par_array(sqlfile)} err]} {
        return 1
    }
    my set dbank $par_array(sqlfile)
    $sqlhandle function date_format SqliteFunc::date_format
    $sqlhandle function NOW {
        clock format [clock seconds] -format "%Y%m%d%H%M%S"
    }
    my set sqlfile $par_array(sqlfile)
    if {[info exists par_array(noMeta)]} {
        my set noMeta $par_array(noMeta)
    }
    my set sqlhandle $sqlhandle
    my set connected 1
    return 0
}
