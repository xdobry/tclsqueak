IDE::ConfigurationMap instproc versionDisplay {} {
    if {[my set isclosed]} {
        set v "V "
    } else {
        set v {}
    }
    return "$v[my set timestamp]"
}
