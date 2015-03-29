IDE::ComponentConfWrapper instproc versionDisplay {} {
    if {[my set isclosed]} {
        set v "V-"
    } else {
        set v {}
    }
    return "$v[my set versioninfo] [my set timestamp]"
}
