IDE::TclKitDeployer proc newBrowser {} {
    if {[catch {package require vfs::mk4}]} {
        IDE::Dialog error "can not load package vfs::mk4 please adapt your Tcl system for starkit or run TclSqueak from starkit"
    } else {
        my instvar browser
        if {![info exists browser] || ![Object isobject $browser]} {
            set browser [my new [Object autoname .kitdeployer]]
        } else {
            IDE::Dialog message "Deployer browser is already open"
        }
    }
}
