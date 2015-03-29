IDE::FontChooser instproc extractFontParameters {} {
    my instvar fontSize fontFamily slant weight font
    array set fontArrgs [font actual fontchooser]
    array set fontArrgs $font
    font configure fontchooser {*}[array get fontArrgs]
    foreach k [array names fontArrgs] {
        switch -exact -- $k {
            -weight {
                set weight $fontArrgs($k)
            }
            -family {
                set fontFamily $fontArrgs($k)
            }
            -size {
                set fontSize $fontArrgs($k)
            }
            -slant {
                set slant $fontArrgs($k)
            }
        }
    }
}
