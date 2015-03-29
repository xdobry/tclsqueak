IDE::IDialogListFilter proc selectFromList {message candidates} {
    set d [IDE::IDialogListFilter new -volatile -message $message [list -candidates $candidates]]
    set ret ""
    if {[$d prompt] eq "ok"} {
        set ret [$d getSelected]
    }
    return $ret

}
