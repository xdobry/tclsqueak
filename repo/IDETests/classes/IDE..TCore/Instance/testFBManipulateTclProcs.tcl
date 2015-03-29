IDE::TCore instproc testFBManipulateTclProcs {} {
    my instvar obj
    # deleting proc group
    set group [$obj createTclProcsGroup testTclGroup2 0]
    $group handleScript {proc testProc2 {} {puts testProc}}
    my assert {[info procs ::testProc2] ne ""}
    $obj removeProcsGroup $group
    my assert {[$obj getProcsGroupWithName testTclGroup2] eq ""}
    my assert {[info procs ::testProc2] eq ""}
    # rename tcl proc group
    set group [$obj getProcsGroupWithName testTclGroup]
    my assert {$group ne ""}
    $group rename testTclGroupBis
    my assert {[$group getObjectName] eq "testTclGroupBis"}
    $group rename testTclGroup
    my assert {[$group getObjectName] eq "testTclGroup"}
}
