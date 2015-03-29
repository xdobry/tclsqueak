IDE::TkWinList instproc serializeWidgetAction w {
    if {[winfo class $w] eq "Toplevel"} {
        append text "set win .test\n\n"
    } else {
        append text "set win .test.w\ntoplevel .test\n\n"
    }
    append text [my serializeWidget $w $w]
    if {[winfo class $w] ne "Toplevel"} {
        append text "pack .test.w"
    }
    IDE::ResultBrowser newBrowser $text
}
