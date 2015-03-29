IDEDBConnectDialog instproc makeModelessDialog {} {
    my instvar oldFocus oldGrab win
    if {![my exists result]} {
       my set result {}
    }
    set oldFocus [focus]
    set oldGrab [::grab current $win]
    if {$oldGrab != ""} {
        set grabStatus [::grab status $oldGrab]
    }
    #::grab $win
    focus $win
    wm protocol [winfo toplevel $win] WM_DELETE_WINDOW [list [self] signalFree]
}
