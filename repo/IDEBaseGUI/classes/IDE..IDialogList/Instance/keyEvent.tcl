IDE::IDialogList instproc keyEvent {key keyCode} {
    my instvar list selectPattern win patternIndex
    update idletasks
    if {$key eq "BackSpace"} {
        set selectPattern  [string range $selectPattern 0 end-1]
    } elseif {$key eq "F4"} {
        incr patternIndex
    } else {
        if {$keyCode eq ""} return
        append selectPattern $keyCode
        set patternIndex 0
    }
    set sindex [lsearch -all -regexp $list (?i)^$selectPattern]
    if {[llength $sindex]==0} {
        set sindex [lsearch -all -regexp $list (?i)$selectPattern]
    }
    set sindex [lindex $sindex $patternIndex]
    if {$sindex ne ""} {
        $win.lframe.listbox selection clear 0 end
        $win.lframe.listbox selection set $sindex $sindex
        $win.lframe.listbox see $sindex
    }
}
