IDE::PreferencesDialog instproc kreu_dosierujo {wnomo nomo priskribo} {
    my instvar opcioj
    set opcioj($nomo) [my prenuOption $nomo]
    frame $wnomo
    label $wnomo.l -textvariable [self]::opcioj($nomo)
    button $wnomo.b -text $priskribo -command [list [self] selektuDosierujon $nomo]
    pack $wnomo.l $wnomo.b -side left
}
