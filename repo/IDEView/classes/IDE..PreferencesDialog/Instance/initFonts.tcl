IDE::PreferencesDialog instproc initFonts fontname {
    set prefFontName ${fontname}_pref
    if {$prefFontName ni [font names]} {
        font create $prefFontName
    }
    font configure $prefFontName {*}[font actual $fontname]
}
