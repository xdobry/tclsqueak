IDE::GuiClassWizard instproc specificInit {} {
    my instvar win guiClassBuilder defaultOptions selectedComponent
    
    set guiClassBuilder [IDE::GuiClassBuilder new -childof [self]]
    my requireNamespace

    frame $win.butonoj
    button $win.butonoj.akceptu -text Create -command [list [self] createUIClass]
    button $win.butonoj.forlasu -text Cancel -command [list [self] destroy]
    pack $win.butonoj.forlasu $win.butonoj.akceptu -side right -padx 5 -pady 5

    frame $win.dframe -width 450 -height 350
    set defaultOptions [$guiClassBuilder getDefaults $selectedComponent]
    my createFromDescription $win [my getOptionsDescription]

    pack $win.butonoj -side bottom -anchor e
    pack $win.kat -side left -fill y -padx 3 -pady 3
    pack $win.dframe -expand yes -fill both
    $win.kat selection set 0
    pack propagate $win.dframe 0
    my montruKategorion 0
}
