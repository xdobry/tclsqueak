IDE::IDialogEntry proc getValueWithCancel {mes {text {}}} {
    set entry [my new -volatile [list -message $mes] [list -entry $text]]
    set ret {}
    if {[$entry prompt] eq "ok"} {
        set ret [$entry entry]
    } else {
        return _cancel
    }
    return $ret
}
