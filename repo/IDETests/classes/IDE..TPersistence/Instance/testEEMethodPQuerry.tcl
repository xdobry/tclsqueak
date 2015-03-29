IDE::TPersistence instproc testEEMethodPQuerry {} {
    my instvar compObj compId methodArr
    set descr [$compObj getObject TestA]
    set obj [$descr getInstanceMethod m1]
    
    $obj printString 
    $obj getDescriptor 
    $obj getVersionString 
    $obj getUserId 
    $obj getName 

    if {[$descr getMethodId m1]!=[$obj getIdValue]} error
    if {$methodArr(m1)!=[$obj getIdValue]} error
    if {[$obj getObjectId]!=[$descr getIdValue]} error

    $obj getCategory 
    $obj getDescriptor 
    if {[$obj getObjectName]!="TestA"} error
    $obj printString 
}
