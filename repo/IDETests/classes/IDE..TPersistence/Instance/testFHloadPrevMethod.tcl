IDE::TPersistence instproc testFHloadPrevMethod {} {
    my instvar compObj methodArr
    set mobj [[$compObj getObject TestA] getInstanceMethodIfExist m1]
    $mobj loadPrevious
    if {$methodArr(m1)!=[$mobj getIdValue]} { error "m1 should have old id"}
    if {[$mobj set basedon] ne "" && [$mobj set basedon]!=0} { error "based on should be  null"}
}
