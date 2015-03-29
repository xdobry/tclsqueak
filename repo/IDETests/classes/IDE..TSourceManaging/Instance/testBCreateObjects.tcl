IDE::TSourceManaging instproc testBCreateObjects {} {
    my instvar cobj
    my addSampleObjects $cobj
    my addSampleObjectsComments $cobj
    my addSampleTclProcsGroup $cobj
    my addSampleTclProcsGroupComments $cobj
}
