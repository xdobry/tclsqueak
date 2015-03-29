IDE::TPersistence instproc testHAunloadComponent {} {
    my instvar compObj
    $compObj unload
    if {[Object isobject TestA]} error
    if {[Object isobject TestB]} error
    if {[Object isobject TestC]} error
    if {[Object isobject TestD]} error
    if {[Object isobject TestE]} error
}
