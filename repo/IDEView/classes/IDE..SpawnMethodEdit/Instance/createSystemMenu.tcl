IDE::SpawnMethodEdit instproc createSystemMenu {} {
    next
    my instvar win
    if {[winfo toplevel $win] eq "."} {
        set twin {}
    } else {
        set twin $win
    }
    $twin.mb add command -label "Invoke" -command [list [self] invoke]
}
