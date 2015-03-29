IDE::SampleElements instproc checkSampleTclProcsGroup obj {
    set group [$obj getProcsGroupWithName testTclGroup]
    my assert {$group ne ""}
    my assert {![$group withNamespace]}
    my assert {[lsearch [$group getProcsNames] testProc]>=0}
    set pobj [$group getProcObjForNameIfExist testProc]
    my assert {$pobj ne ""}
    my assert {[$pobj getName] eq "testProc"}
    my assert {[info proc ::testProc] ne ""}

    set group [$obj getProcsGroupWithName testNamespace]
    my assert {$group ne ""}
    my assert {[$group withNamespace]}
    my assert {[lsearch [$group getProcsNames] "testNamespace::testProc"]>=0}
    set pobj [$group getProcObjForNameIfExist testNamespace::testProc]
    my assert {$pobj ne ""}
    my assert {[$pobj getName] eq "testNamespace::testProc"}

    my assert {[info proc ::testNamespace::testProc] ne ""}
}
