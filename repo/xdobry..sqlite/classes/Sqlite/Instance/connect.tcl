Sqlite instproc connect par_list {
    my instvar errorMessage sqlfile sqlhandle connected
    array set par_array $par_list
    set sqlhandle [Object autoname sqlite]
    if {[catch {sqlite $sqlhandle $par_array(sqlfile)} err]} {
        set errorMessage $err
        return 1
    }
    my set dbank $par_array(sqlfile)
    set sqlfile $par_array(sqlfile)
    if {[info exists par_array(noMeta)]} {
        my set noMeta $par_array(noMeta)
    }
    set sqlhandle $sqlhandle
    set connected 1
    return 0
}
