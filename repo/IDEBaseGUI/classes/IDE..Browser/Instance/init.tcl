IDE::Browser instproc init {window args} {
    my instvar win
    set win $window
    if {![winfo exists $win]} {
        my buildTopLevel
        wm withdraw $win
        menu $win.mb -tearoff 0
    } else {
        menu .mb -tearoff 0
    }
    wm protocol [winfo toplevel $win] WM_DELETE_WINDOW [list [self] closeWindow]
    wm title [winfo toplevel $win] [my getTitle]
    wm iconname [winfo toplevel $win] [my getTitle]

    my specificInit
    my createSystemMenu

    wm deiconify [winfo toplevel $win]
    focus $win

    # debug helper
    bind [winfo toplevel $win] <Control-I> [list [self] inspect]
    next
}
