IDE::MethodEditSynchronizatorMix instproc setBodyTextControler {tvclass tvtype tmethod controler} {
    next
    set key "$tvclass $tvtype $tmethod"
    my registerKeyForInstance $key
}
