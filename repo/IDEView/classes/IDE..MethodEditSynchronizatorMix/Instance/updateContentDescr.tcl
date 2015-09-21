IDE::MethodEditSynchronizatorMix instproc updateContentDescr contentDescr {
    next
    lassign $contentDescr tvclass tvtype tmethod
    set key "$tvclass $tvtype $tmethod"
    my registerKeyForInstance $key
}
