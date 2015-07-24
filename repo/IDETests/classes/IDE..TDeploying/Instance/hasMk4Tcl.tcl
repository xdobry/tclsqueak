IDE::TDeploying instproc hasMk4Tcl {} {
    if {[catch {package require Mk4tcl}]} {
        return 0
    }
    return 1
}
