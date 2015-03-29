IDE::PreferencesDialog instproc akceptuSxangxojn {} {
    foreach {kat difino} [my prenuPriskribo] {
        foreach {nomo priskribo specio} $difino {
            my metuOption $nomo [my prenu_$specio $nomo]
        }
    }
    my destroy
}
