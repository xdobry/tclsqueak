IDE::FontChooser proc getFont {{font {}}} {
    set entry [my new -volatile [list -font $font]]
    set ret {}
    if {[$entry prompt] eq "ok"} {
        set ret [$entry font]
    }
    return $ret
}
