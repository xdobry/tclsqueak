ORATcl instproc hasfunction func {
    set iclass ORATcl::SqlQuery
    if {[[my info class] info instprocs $func] ne ""} {
        return 1
    } 
    
    if {[$iclass info instprocs $func] ne ""} {
        return 1
    } else {
        return 0
    }
}
