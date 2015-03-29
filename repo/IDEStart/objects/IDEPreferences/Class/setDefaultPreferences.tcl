IDEPreferences proc setDefaultPreferences {} {
    my array set preferences {
        textfont {-family Courier -size -14}
        listboxfont {-family Helvetica -size -12 -weight bold}
        textcolor {}
        listboxcolor {}
        startDefault 0
        ignoreIDEComponents 0
    }
    my set syntaxCheck 1
    my set syntaxHightlight 2
}
