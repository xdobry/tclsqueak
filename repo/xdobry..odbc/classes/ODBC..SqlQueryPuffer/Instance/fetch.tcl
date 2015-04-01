ODBC::SqlQueryPuffer instproc fetch {} {
    my instvar data position
    if {$position<0} {
        return 
    }
    set ret [lindex $data $position]
    incr position
    return $ret
}
