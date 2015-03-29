IDE::PreferencesDialog instproc kreu_font {wnomo nomo priskribo} {
    frame $wnomo
    label $wnomo.flab -text "$priskribo"
    label $wnomo.fexample  -borderwidth 2 -relief sunken -text "Example text 123" -font $nomo
    button $wnomo.fchange -text Change -command [list [self] changeFont $nomo]
    pack $wnomo.flab $wnomo.fexample $wnomo.fchange -side left
}
