PrsContext instproc check_proc {count command notifier} {
    my instvar namespace repository
    set bodyElem [$command getElem 3]
    if {[$bodyElem hasclass PrsNoSubst]} {
        my subParse $command $notifier $namespace
    } else {
        set nameElem [$command getElem 1]
        if {[$nameElem hasclass PrsLiteral]} {
            # TODO we could get also args count
            $repository registerProc [$nameElem prsString] [list 0 -1] $namespace
        }
    }
}
