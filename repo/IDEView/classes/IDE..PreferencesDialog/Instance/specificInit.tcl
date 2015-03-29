IDE::PreferencesDialog instproc specificInit {} {
    my instvar win opcioj aktualaPago
    my requireNamespace

    my initFonts textfont
    my initFonts listboxfont

    listbox $win.kat
    bind $win.kat <<ListboxSelect>> [list [self] selektuListoElemento]

    frame $win.butonoj
    button $win.butonoj.akceptu -text OK -command [list [self] akceptuSxangxojn]
    button $win.butonoj.forlasu -text Cancel -command [list [self] destroy]
    pack $win.butonoj.forlasu $win.butonoj.akceptu -side right -padx 5 -pady 5

    frame $win.dframe -width 450 -height 350
    set i 0
    set aktualaPago -1
    foreach {kat difino} [my prenuPriskribo] {
        $win.kat insert end $kat
        labelframe $win.dframe.k$i -text $kat
        set kat [subst $kat]
        set difino [subst $difino]
        set y 0
        foreach {nomo priskribo specio} $difino {
            set onomo $win.dframe.k$i.o$y
            #puts "kreu_$specio $onomo $nomo $priskribo"
            my kreu_$specio $onomo $nomo $priskribo
            pack $onomo -anchor w
            incr y
        }
        incr i
    }
    pack $win.butonoj -side bottom -anchor e
    pack $win.kat -side left -fill y -padx 3 -pady 3
    pack $win.dframe -expand yes -fill both
    $win.kat selection set 0
    pack propagate $win.dframe 0
    my montruKategorion 0
}
