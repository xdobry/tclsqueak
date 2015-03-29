Sqlinterface proc getInterfacesCleaned {} {
    set ret []
    global tcl_platform
    catch {package require not_exists}
    set packages [package names]
    foreach interfaces [my getInterfaces] {
        set pkg [lindex $interfaces 3]
        if {[lindex $interfaces 0] eq "ms_access" && $tcl_platform(platform) ne "windows"} continue
        if {[lindex $interfaces 0] eq "ms_sql" && $tcl_platform(platform) ne "windows"} continue
        if {[lsearch $packages [lindex $pkg 0]]>=0 ||
            [file exists [lindex $pkg 1]]} {
            lappend ret $interfaces
        }
    }
    return $ret
}
