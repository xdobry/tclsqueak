IDE::DialogHelper instproc buildTopLevel {} {
    my instvar win parent
    ::toplevel $win -class Dialog
    wm iconname $win Dialog
    if {[info exists parent] && $parent ne ""} {
        if {[winfo viewable $parent]} {
            wm transient $win $parent
        }
    }
    bind $win <Escape> [list [self] actionCancel]
}
