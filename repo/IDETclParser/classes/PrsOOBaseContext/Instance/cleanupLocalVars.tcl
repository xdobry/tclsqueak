PrsOOBaseContext instproc cleanupLocalVars {} {
    my instvar varArr
    foreach variable [array names varArr] {
        lassign $varArr($variable) type scope
        if {[lindex $scope 0] eq "local"} {
            unset -nocomplain varArr($variable)
        }
    }
}
