IDE::User proc getSystemUser {} {
    global env
    if {[info exists env(USER)]} {
        set user $env(USER)
    } elseif {[info exists env(USERNAME)]} {
        set user $env(USERNAME)
    } else {
        puts "user can not be read from env(USER) and was set to 'user'" 
        set user user
    }
    return $user
}
