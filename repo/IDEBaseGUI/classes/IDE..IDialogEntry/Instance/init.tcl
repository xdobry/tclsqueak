IDE::IDialogEntry instproc init {} {
    my instvar win entry width cache
    next
    if {[info exists cache] && $cache ne ""} {
        ttk::combobox $win.entry -width $width -values [my getCachedValues $cache]
    } else {
        ::entry $win.entry -width $width
    }
    if {![info exists entry]} {
        set entry {}
    } else {
        $win.entry insert 0 $entry
    }
    pack $win.entry -fill both -expand yes -before $win.buttons -padx 10 -pady 5
    focus $win.entry
    wm deiconify $win
}
