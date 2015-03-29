IDE::PreferencesDialog instproc kreu_string {wnomo nomo priskribo} {
    my instvar opcioj
    set opcioj($nomo) [my prenuOption $nomo]
    frame $wnomo
    label $wnomo.l -text $priskribo
    entry $wnomo.e -textvariable [self]::opcioj($nomo)
    pack $wnomo.l $wnomo.e -side left
}
