ODBCAccess instproc connect par_list {
    [self] instvar handle connected
    set handle [Object autoname odbchandle]
    array set par_array $par_list
    foreach k [array names par_array] {
         my set $k $par_array($k)
    }
    set driver {Microsoft Access Driver (*.mdb)}
    # mdb file not exists create it
    set mdb_file $par_array(mdb_file)
    if {![file exists $mdb_file]} {
        database configure config_dsn $driver [list CREATE_DB=\"[file nativename $mdb_file]\" General]
    }
    if {[my exists extendedAnsiSQL] && [my set extendedAnsiSQL] eq "1"} {
        set addParam "ExtendedAnsiSQL=1;"
    } else {
        set addParam ""
    }
    database connect $handle "DRIVER=$driver; DBQ=[file nativename $mdb_file]; FIL=MS Access; $addParam EXCLUSIVE=Yes;"
    my set dbank $mdb_file
    set connected 1
    return 1
}
