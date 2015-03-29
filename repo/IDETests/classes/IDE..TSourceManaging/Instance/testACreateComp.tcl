IDE::TSourceManaging instproc testACreateComp {} {
    my instvar cobj
    set cobj [IDE::Component getCompObjectForName TestCase]
    $cobj setVersionNumber 2.0
}
