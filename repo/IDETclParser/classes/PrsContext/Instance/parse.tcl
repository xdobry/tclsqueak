PrsContext instproc parse script {
    # !!! no base list consistency check
    my instvar errors parser rootCommand

    my initParser $script
    if {![info complete $script]} {
        lappend errors [list 0 0 "Method body is not proper tcl list"]
        return 0
    }
    set rootCommand [$parser getCommand $parser]

    my parseCommand
}
