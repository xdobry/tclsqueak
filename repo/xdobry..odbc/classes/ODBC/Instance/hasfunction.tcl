ODBC instproc hasfunction func {
    set iclass ODBC::SqlQueryPuffer
    if {[[my info class] info instprocs $func] ne ""} {
        return 1
    } 
    
    if {[$iclass info instprocs $func] ne ""} {
        return 1
    } else {
        return 0
    }
}
