IDE::FileList instproc selectGlob args {
    set pat [IDE::IDialogEntry getValue "Give select patern" *.*]
    if {$pat ne ""} {
        my instvar win
        foreach i [lsearch -glob -all [my getList] $pat] {
           $win.listbox selection set $i
        }
    }
}
