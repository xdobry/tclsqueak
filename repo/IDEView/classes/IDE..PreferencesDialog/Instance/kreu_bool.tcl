IDE::PreferencesDialog instproc kreu_bool {wnomo nomo priskribo} {
    my instvar opcioj
    set opcioj($nomo) [my prenuOption $nomo]
    checkbutton $wnomo -text $priskribo -variable [self]::opcioj($nomo)
}
