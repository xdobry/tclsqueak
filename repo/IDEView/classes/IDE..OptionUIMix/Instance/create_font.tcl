IDE::OptionUIMix instproc create_font {wnomo nomo priskribo} {
    frame $wnomo
    ttk::label $wnomo.flab -text "$priskribo"
    label $wnomo.fexample  -borderwidth 2 -relief sunken -text "Example text 123" -font $nomo
    ttk::button $wnomo.fchange -text Change -command [list [self] changeFont $nomo]
    pack $wnomo.flab $wnomo.fexample $wnomo.fchange -side left
}
