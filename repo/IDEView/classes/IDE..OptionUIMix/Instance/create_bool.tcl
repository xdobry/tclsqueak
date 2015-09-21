IDE::OptionUIMix instproc create_bool {wnomo nomo priskribo} {
    my instvar opcioj
    set opcioj($nomo) [my getOption $nomo]
    ttk::checkbutton $wnomo -text $priskribo -variable [self]::opcioj($nomo)
}
