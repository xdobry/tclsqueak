IDE::OptionUIMix instproc create_dir {wnomo nomo priskribo} {
    my instvar opcioj
    set opcioj($nomo) [my getOption $nomo]
    frame $wnomo
    ttk::label $wnomo.l -textvariable [self]::opcioj($nomo)
    ttk::button $wnomo.b -text $priskribo -command [list [self] selectDir $nomo]
    pack $wnomo.l $wnomo.b -side left
}
