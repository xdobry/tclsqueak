MyUIClass instproc init window {
    my instvar win root

    # you need this if you want do bind object variables to tk widgets (for example -textvariable)
    my requireNamespace

    # root is the root window
    # and win is the prefix that can be used to build children windows
    # like $win.child
    # This is needed because of special handling of main window .
    # please do not use $win alone in this case use $root
    
    set win $window
    set root $window
    set needDeiconify 0
    
    if {![winfo exists $root]} {
        my buildTopLevel
        wm withdraw $root
        set needDeiconify 1
    } else {
        if {$win eq "."} {
            set win ""
        }
    }
    
    wm protocol [winfo toplevel $root] WM_DELETE_WINDOW [list [self] closeWindow]
    wm title [winfo toplevel $root] [my getTitle]
    wm iconname [winfo toplevel $root] [my getTitle]

    my initWidgets
    my createMenu

    if {$needDeiconify} {
        wm deiconify [winfo toplevel $root]
    }

    next 
}
