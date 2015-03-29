IDE::IDialogEntry instproc postOk {} {
    my instvar win entry cache
    set entry [$win.entry get]
    if {[info exists cache] && $cache ne ""} {
        IDE::InputCache addValueCache $cache $entry
    }
    next
}
