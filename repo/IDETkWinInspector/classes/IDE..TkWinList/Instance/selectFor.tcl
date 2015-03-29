IDE::TkWinList instproc selectFor window {
    my instvar vwindow
    if {$window eq ""} {
        my setList [list .]
    } else {
        set children [winfo children $window]
        if {[llength $children]==0} return
        my setList $children
    }
    set vwindow $window
    my selectItem {}
}
