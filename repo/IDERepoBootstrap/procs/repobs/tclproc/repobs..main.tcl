proc repobs::main {} {
    global argv
    if {[llength $argv]==0} {
        main_startide
    } elseif {[lindex $argv 0] in {help -h --help}} {
        main_help
    } else {
        set cmd [lindex $argv 0]
        if {$cmd ni {help dump start export}} {
            puts "unknown command $cmd try 'help' to get help"
        } else {
            main_$cmd {*}[lrange $argv 1 end]
        }
    }
}
