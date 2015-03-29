IDE::IDialogList proc getListItem {message list {default {}}} {
    set listdialog [my new -volatile [list -message $message] [list -list $list] [list -selectedItem $default]]
    if {[$listdialog prompt] ne "ok"} {
        return {}
    }
    set result [$listdialog selectedItem]
    return $result
}
