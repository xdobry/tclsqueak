IDE::Browser instproc createNonSystemMenu {} {
    my instvar win
    if {[winfo toplevel $win] eq "."} {
        set twin {}
    } else {
        set twin $win
    }
    [winfo toplevel $win] configure -menu $twin.mb
}
