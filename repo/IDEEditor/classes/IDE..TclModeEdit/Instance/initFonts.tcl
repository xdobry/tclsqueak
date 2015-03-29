IDE::TclModeEdit instproc initFonts {} {
    next
    if {"textfontbold" ni [font names]} {
        font create textfontbold -size [font configure textfont -size] -family [font configure textfont -family] -weight bold
    }
}
