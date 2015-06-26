PrsCheckerOptions proc checkAndSetupRootDir {} {
    my instvar rootDir
    if {![info exists rootDir]} {
        if {[Object isobject IDE::System]} {
            set rootDir [IDE::System getSystemDir]
        } else {
            set rootDir [pwd] 
        }
    }
}
