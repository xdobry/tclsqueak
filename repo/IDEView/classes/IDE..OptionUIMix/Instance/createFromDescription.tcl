IDE::OptionUIMix instproc createFromDescription {win description} {
    my instvar aktualaPago
    set aktualaPago -1
    
    listbox $win.kat
    bind $win.kat <<ListboxSelect>> [list [self] selektuListoElemento]

    set i 0
    foreach {kat difino} $description {
        $win.kat insert end $kat
        labelframe $win.dframe.k$i -text $kat
        set kat [subst $kat]
        set difino [subst $difino]
        set y 0
        foreach {nomo priskribo specio} $difino {
            set onomo $win.dframe.k$i.o$y
            my create_$specio $onomo $nomo $priskribo
            pack $onomo -anchor w
            incr y
        }
        incr i
    }
}
