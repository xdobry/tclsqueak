IDEStarter proc setWaitDialog {} {
    toplevel .wait
    label .wait.label -text "Wait. TclSqueak is loading ..."
    set x [expr [winfo screenwidth .wait]/2 - 150]
    set y [expr [winfo screenheight .wait]/2 - 100]
    wm geom .wait +$x+$y
    pack .wait.label -padx 50 -pady 50
    wm withdraw .
    update idletasks
}
