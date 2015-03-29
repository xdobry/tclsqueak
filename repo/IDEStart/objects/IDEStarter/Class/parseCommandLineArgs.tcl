IDEStarter proc parseCommandLineArgs {} {
    global argv
    foreach desc [my argumentsDescription] {
        set argDesc([lindex $desc 0]) [lrange $desc 1 end]
    }
    set i 0
    while {$i<[llength $argv]} {
        set key [lindex $argv $i]
        if {![info exists argDesc($key)]} {
            puts "unknown command line parameter $key"
            my showHelpAndExit
        }
        set type [lindex $argDesc($key) 0]
        set keyn [string range $key 1 end]
        switch $type {
            bool {
                my set $keyn 1
            }
            string {
                incr i
                my set $keyn [lindex $argv $i]
            }
            action {
                my [lindex $argDesc($key) 2]
            }
            paraction {
                incr i
                my [lindex $argDesc($key) 2] [lindex $argv $i]
            }
        }
        incr i
    }
}
