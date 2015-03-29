MySql instproc connect par_list {
    my instvar handle connected dbank user password hostname  socket
    array set par_array $par_list
    set par ""
    if {[info exists par_array(user)] && $par_array(user) ne ""} {
        lappend par -user $par_array(user)
        set user $par_array(user)
    }
    if {[info exists par_array(password)] && $par_array(password) ne ""} {
        lappend par -password $par_array(password)
        set password $par_array(password)
    }
    if {[info exists par_array(hostname)] && $par_array(hostname) ne ""} {
        lappend par -host $par_array(hostname)
        set hostname $par_array(hostname)
    }
    if {[info exists par_array(socket)] && $par_array(socket) ne ""} {
        lappend par -socket $par_array(socket)
        set socket $par_array(socket)
    }
    if {[info exists par_array(dbank)] && $par_array(dbank) ne ""} {
        lappend par -db $par_array(dbank)
        set dbank $par_array(dbank)
    }

    # Kein Tcl-Fehler Abfang
    if {[catch {set sqlhandle [mysqlconnect {*}$par]} err]!=0} {
        my errorMessage $err
        return 0
    }
    set connected 1
    set handle $sqlhandle
    return 1
}
