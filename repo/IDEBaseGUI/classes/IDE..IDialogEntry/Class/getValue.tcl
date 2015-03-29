IDE::IDialogEntry proc getValue {mes {text {}} {cacheName {}}} {
    set entry [my new -volatile [list -message $mes] [list -entry $text] [list -cache $cacheName]]
    set ret {}
    if {[$entry prompt] eq "ok"} {
        set ret [$entry entry]
    }
    return $ret
}
