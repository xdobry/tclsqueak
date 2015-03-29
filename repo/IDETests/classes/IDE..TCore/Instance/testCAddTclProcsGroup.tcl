IDE::TCore instproc testCAddTclProcsGroup {} {
    my instvar obj tclgroup

    my addSampleTclProcsGroup $obj
    my checkSampleTclProcsGroup $obj
    set tclgroup [$obj getProcsGroupWithName testTclGroup]

    # overwrite / redefine proc
    set pobj [$tclgroup getProcObjForNameIfExist ::testProc]
    $tclgroup handleScript {proc testProc {} {puts testProc2}}
    my assert {[$tclgroup getProcObjForNameIfExist ::testProc]==$pobj}
    my assert {[regexp testProc2 [$pobj getBody]]}
    my assert {[llength [$tclgroup getProcsNames]]==1}
    my assert {[info procs ::testProc] ne ""}
}
