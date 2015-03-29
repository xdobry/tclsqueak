IDE::TPersistence instproc testFIBRereadForTclGroup {} {
    # test versioning and loading versions of tcl groups
    my instvar compObj
    set tclgroup [$compObj getProcsGroupWithName testTclGroup]
    set oldid [$tclgroup set objectid]
    $tclgroup versionEdition
    $tclgroup createNewEdition
    set newid [$tclgroup set objectid]
    my assert {$newid!=$oldid}

    $tclgroup handleScript {proc testProc {} {puts testProc2}}
    $tclgroup handleScript {proc testProc2 {} {puts testProc}}

    $tclgroup changeVersionTo $oldid
    my assert {$oldid==[$tclgroup set objectid]}

    my assert {[info procs testProc2] eq ""}
    my assert {![regexp modified2 testProc2 [info procs body]]}
    
}
