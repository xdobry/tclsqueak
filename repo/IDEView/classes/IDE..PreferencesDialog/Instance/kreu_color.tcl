IDE::PreferencesDialog instproc kreu_color {wnomo nomo priskribo} {
    my instvar opcioj colorExample
    frame $wnomo
    label $wnomo.flab -text $priskribo
    set color [my prenuOption $nomo]
    set opcioj($nomo) $color
    ttk::label $wnomo.fexample  -borderwidth 2 -relief sunken -text {       }
    if {$color ne ""} {
        $wnomo.fexample configure -background $color
        set colorExample($nomo) $wnomo.fexample
    }
    ttk::button $wnomo.fchange -text Change -command [list [self] changeColor $nomo]
    pack $wnomo.flab $wnomo.fexample $wnomo.fchange -side left
}
