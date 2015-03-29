IDE::DBPersistence instproc increaseVersionInfo {} {
    # increase a last number found in versioninfo
    # for example: 1.0.3 will be 1.0.4 
    my instvar versioninfo
    regexp -indices -all -- {[0-9]+} $versioninfo indices
    if {[info exists indices] && [lindex $indices 0]!=-1} {
        set number [string range $versioninfo [lindex $indices 0] [lindex $indices 1]]
        incr number
        set versioninfo [string replace $versioninfo  [lindex $indices 0] [lindex $indices 1] $number]
    }
}
