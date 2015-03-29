IDEDBConnectDialog instproc buildMainWindow {} {
    my instvar win frame

    set win .dialog
    catch {destroy $win}
    toplevel $win -class Dialog
    wm withdraw $win
    wm title $win "Connect to Database"
    wm iconname $win Dialog
    wm protocol $win WM_DELETE_WINDOW [list [self] actionCancel]
    
    set frame [frame $win.frame]
    frame $win.buttons -relief raised

    pack $frame -fill both -expand yes

    button $win.buttons.ok -text Ok -command [list [self] actionOk]
    button $win.buttons.cancel -text Cancel -command [list [self] actionCancel]
    pack $win.buttons.ok $win.buttons.cancel -side left  -padx 10 -pady 5

    pack $win.buttons -side bottom -fill both

    # 6. Withdraw the window, then update all the geometry information
    # so we know how big it wants to be, then center the window in the
    # display and de-iconify it.

    update idletasks
    set x [expr [winfo screenwidth $win]/2 - [winfo reqwidth $win]/2  - [winfo vrootx [winfo parent $win]]]
    set y [expr [winfo screenheight $win]/2 - [winfo reqheight $win]/2  - [winfo vrooty [winfo parent $win]]]
    wm geom $win +$x+$y

}
