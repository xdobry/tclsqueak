IDE::PreferencesDialog instproc changeFont nomo {
    set erg [IDE::FontChooser getFont [font actual $nomo]]
    if {$erg ne ""} {
        font configure $nomo {*}$erg
    }
}
