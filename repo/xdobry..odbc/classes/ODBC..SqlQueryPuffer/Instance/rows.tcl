ODBC::SqlQueryPuffer instproc rows {} {
    if {[my set position]<0} {
        return 0
    }
    llength [my data]
}
