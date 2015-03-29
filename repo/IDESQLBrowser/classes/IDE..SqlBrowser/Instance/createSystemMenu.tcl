IDE::SqlBrowser instproc createSystemMenu {} {
    if {![my isApplication]} {
        next 
    } else {
        my instvar win
        global tcl_platform
        set ms [IDE::MenuStruct new Help 0]
        $ms addCommand {About} [list [self] showAbout]
        if {$tcl_platform(platform) eq "windows"} {
            $ms addCommand {Show Tcl Console} [list console show]
        }
        if {[winfo toplevel $win] eq "."} {
            set twin {}
        } else {
            set twin $win
        }
        $ms createTkMenu $twin.mb.idesystem $twin
        $twin.mb add cascade -label [$ms set name] -menu $twin.mb.idesystem -underline 0

        [winfo toplevel $win] configure -menu $twin.mb
    }
}
