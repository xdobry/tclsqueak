ODBC instproc connect par_list {
    [self] instvar handle connected
    set handle [Object autoname odbchandle]
    array set par_array $par_list
    foreach k [array names par_array] {
         my set $k $par_array($k)
    }
    if {[info exist par_array(user)] && $par_array(user) ne "" && [info exist par_array(password)] && $par_array(password) ne ""} {
	  database connect $handle $par_array(datasource) $par_array(user) $par_array(password)
    } elseif {[info exist par_array(user)] && $par_array(user) ne ""} {
	  database connect $handle $par_array(datasource) $par_array(user)
    } else {
	  database connect $handle $par_array(datasource)
    }
    my set dbank $par_array(datasource)
    set connected 1
    return 1
}
