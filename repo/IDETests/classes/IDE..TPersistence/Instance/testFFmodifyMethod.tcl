IDE::TPersistence instproc testFFmodifyMethod {} {
    my instvar compObj methodArr
    namespace eval :: {
         TestA instproc m1 {} {
             puts modified
         }
    }
    set mobj [[$compObj getObject TestA] getInstanceMethodIfExist m1]
    if {$methodArr(m1)==[$mobj getIdValue]} {error "m1 should have new id"}
    if {$methodArr(m1)!=[$mobj set basedon]} {error "old id should be based on"}
}
