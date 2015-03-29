PrsContext instproc check_package {count command notifier} {
    my instvar namespace repository
    if {$count>=2} {
        if {[[$command getElem 1] isLiteral require] && [[$command getElem 2] hasclass PrsLiteral]} {
            $repository loadRepoForPackage [[$command getElem 2] prsString]
            [$command getElem 2] set ref [list package [[$command getElem 2] prsString]]
        } elseif {[[$command getElem 1] isLiteral provide] && [[$command getElem 2] hasclass PrsLiteral]} {
            [$command getElem 2] set def [list package [[$command getElem 2] prsString]]
        }
    }
}
