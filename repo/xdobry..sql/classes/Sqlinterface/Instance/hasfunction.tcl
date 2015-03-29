Sqlinterface instproc hasfunction func {
    foreach obj [[my info class] info children] {
       if {[Object isclass $obj]} {
         set iclass $obj
         break
       }
    }

    if {[[my info class] info instprocs $func] ne ""} {
        return 1
    } 
    
    if {[$iclass info instprocs $func] ne ""} {
        return 1
    } else {
        return 0
    }
}
