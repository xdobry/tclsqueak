IDE::User instproc getName args {
    if {[my exists longName] && [my set longName] ne ""} {
        return [my set longName]
    }
   
    return [my set name]
}
