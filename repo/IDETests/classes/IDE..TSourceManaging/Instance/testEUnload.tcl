IDE::TSourceManaging instproc testEUnload {} {
    my instvar cobj
    $cobj unload
    my hardAssert {![Object isobject TestA]}
    my hardAssert {![Object isobject TestB]}
    my hardAssert {![Object isobject TestC]}
}
