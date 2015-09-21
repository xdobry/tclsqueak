IDE::OptionUIMix instproc acceptOptions {} {
    foreach {kat difino} [my getOptionsDescription] {
        foreach {nomo priskribo specio} $difino {
            my setOption $nomo [my get_$specio $nomo]
        }
    }
}
