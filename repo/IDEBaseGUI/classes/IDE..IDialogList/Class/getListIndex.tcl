IDE::IDialogList proc getListIndex {message list {default {}}} {
    set listdialog [my new -volatile [list -message $message] [list -list $list] [list -selectedItem $default]]
    $listdialog set selectedIndex -1
    if {[$listdialog prompt] ne "ok"} {
        return {}
    }
    set result [$listdialog set selectedIndex]
    return $result
}
