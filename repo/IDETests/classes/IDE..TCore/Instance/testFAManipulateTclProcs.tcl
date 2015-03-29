IDE::TCore instproc testFAManipulateTclProcs {} {
    my instvar obj tclgroup
    # changing definitions script
    set tclgroupNS [$obj getProcsGroupWithName testNamespace]
    set defBody {
        namespace eval ::testNamespace {variable myvar 12}
    }
    my assert {[$tclgroupNS withNamespace]}
    $tclgroupNS handleDefinitionScript $defBody
    #my assert {[$tclgroupNS getDefBody] ne ""}

    # deleting proc
    $tclgroup handleScript {proc testProc2 {} {puts testProc}}
    my assert {[$tclgroup getProcObjForNameIfExist testProc2] ne ""}
    my assert {[lsearch [$tclgroup getProcsNames] testProc2]!=-1}
    my assert {[info procs ::testProc2] ne ""}
    $tclgroup deleteMethod testProc2
    my assert {[$tclgroup getProcObjForNameIfExist testProc2] eq ""}
    my assert {[lsearch [$tclgroup getProcsNames] testProc2]<0}
    my assert {[info procs ::testProc2] eq ""}
}
