IDE::ComponentConfWrapper instproc getRequirements {} {
    if {![my exists reqComps]} {
        my instvar reqComps
        set reqComps [list]
        foreach row [[my getPersistenceManager] selectAsList ComponentRequire name componentid [my set componentid]] {
            lappend reqComps [lindex $row 0]
        }
    }
    my set reqComps
}
