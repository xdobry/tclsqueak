PrsContext instproc check_unset {count command notifier} {
    for {set x 1} {$x<=$count} {incr x} {
        set prsObject [$command getElem $x]
        if {$x==1 && $count>=2 && [$prsObject istype ::PrsLiteral]} {
            set name [$prsObject prsString]
            if {$name eq "-nocomplain"} {
                return
            }
        }
        my checkVariableFrom $prsObject $notifier
    }
}
