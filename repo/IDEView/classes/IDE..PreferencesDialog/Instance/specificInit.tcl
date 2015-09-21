IDE::PreferencesDialog instproc specificInit {} {
    my instvar win
    my requireNamespace

    my initFonts textfont
    my initFonts listboxfont


    frame $win.butonoj
    button $win.butonoj.akceptu -text OK -command [list [self] acceptOptions]
    button $win.butonoj.forlasu -text Cancel -command [list [self] destroy]
    pack $win.butonoj.forlasu $win.butonoj.akceptu -side right -padx 5 -pady 5

    frame $win.dframe -width 450 -height 350
    my createFromDescription $win [my getOptionsDescription]

    pack $win.butonoj -side bottom -anchor e
    pack $win.kat -side left -fill y -padx 3 -pady 3
    pack $win.dframe -expand yes -fill both
    $win.kat selection set 0
    pack propagate $win.dframe 0
    my montruKategorion 0
}
