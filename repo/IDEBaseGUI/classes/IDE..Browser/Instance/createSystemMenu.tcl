IDE::Browser instproc createSystemMenu {} {
    my instvar win
    if {![Object isobject IDE::System]} {
        return
    }
    set ms [IDE::System getMenuStruct]
    if {[winfo toplevel $win] eq "."} {
        set twin {}
    } else {
        set twin $win
    }
    $ms createTkMenu $twin.mb.idesystem $twin
    $twin.mb add cascade -label [$ms set name] -menu $twin.mb.idesystem -underline 0

    [winfo toplevel $win] configure -menu $twin.mb
}
