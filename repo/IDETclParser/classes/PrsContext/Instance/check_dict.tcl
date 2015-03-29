PrsContext instproc check_dict {count command notifier} {
    set elem [$command getElem 1]
    if {[$elem hasclass PrsLiteral]} {
        set name [$elem prsString]
        if {$name eq "for" && $count>=3} {
            my addVariableFromList [$command getElem 2] $notifier
            my evalContents [$command getElem 4]
        } elseif {$name in {set lappend incr append} && $count>=1} {
            my addVariableFrom [$command getElem 2] $notifier
        }
    }
}
