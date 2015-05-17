IDE::FindReplace proc showWindow {} {
    my instvar win view prompt
    if {![info exists win] || ![winfo exists $win]} {
        my buildWindow .findreplace
        set prompt 1
    }
    wm group $win [winfo toplevel [$view set win]]
    wm deiconify $win
    $win.main.find configure -values [IDE::InputCache getValuesCache find]
    $win.main.search configure -values [IDE::InputCache getValuesCache replace]
    focus $win.main.find
}
