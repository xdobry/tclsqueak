PrsContext instproc check_switch {count command notifier} {
    set last [$command getElem end]
    if {[$last info class] ne "::PrsNoSubst"} return
    $last extractList
    if {[$last exists list]} {
        if {[llength [$last list]]%2!=0} {
            my addError "expect odd elements in the list" $last
        }
        foreach {pattern script} [$last list] {
            if {$script ne ""} {my evalContents $script}
        }
    }
}
