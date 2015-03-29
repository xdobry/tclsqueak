IDEStarter proc loadComponentFromAny name {
    if {[my exists sqlhandle]} {
        if {[IDE::Component getCompObjectForNameIfExist $name] eq ""} {
            my loadComponent $name
        }
    } else {
        package require $name
    }
}
