PrsContext instproc check_load {count command notifier} {
    my instvar namespace repository
    if {$count>=1} {
        if {[[$command getElem 1] hasclass PrsLiteral]} {
            $repository loadRepoForPackage [[$command getElem 1] prsString]
            [$command getElem 1] set ref [list package [[$command getElem 1] prsString]]
        }
    }
}
