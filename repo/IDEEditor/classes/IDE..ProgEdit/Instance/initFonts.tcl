IDE::ProgEdit instproc initFonts {} {
    #if {"textfontbold" ni [font names]} {
    #    font create textfontbold -size [font configure textfont -size] -family [font configure textfont -family] -weight bold
    #}

}
