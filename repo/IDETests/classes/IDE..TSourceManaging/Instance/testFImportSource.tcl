IDE::TSourceManaging instproc testFImportSource {} {
    my instvar cobj
    IDE::Component importCompsFromFile [my getFileName]
    set cobj [IDE::Component getCompObjectForNameIfExist TestCase]
    #[self] halt
    my assert {$cobj ne ""}
    my checkSampleObjects $cobj
    my checkSampleObjectsComments $cobj
    my checkSampleTclProcsGroup $cobj
    my checkSampleTclProcsGroupComments $cobj

}
