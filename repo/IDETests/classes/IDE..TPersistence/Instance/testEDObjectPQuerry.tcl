IDE::TPersistence instproc testEDObjectPQuerry {} {
    my instvar compObj compId methodArr compObjArr
    set descr [$compObj getObject TestA]
    
    $descr printString 
    $descr getDescriptor 
    $descr getVersionString 
    $descr getUserId 

    if {[$descr getObjectName] ne "TestA"} { error {wrong name}}
    if {$compObjArr(TestA)!=[$descr getIdValue]} error
    $descr setInstanceMethodsArray methodArr

    if {![$descr isTrackingOn]} { error "shoul be 1"}
    $descr getMetadataText 
    $descr setClassMethodsArray arr_ref
    if {[$descr getComponentId]!=$compId} { error {wrong compid}}
    $descr getObject 
    $descr getName 
    $descr getClassMethodIfExist name
    if {[$descr getType] ne "Class"} { error {wrong type}}
    $descr printString
    #[self] halt 
    if {[$descr getComponent]!=$compObj} { error {wrom compObj}}
    $descr getDescriptor 
    $descr getDefBody 
    $descr getMethodDescriptions
    #[self] halt
}
