IDE::TPersistence instproc testEAComponentImport {} {
    my instvar compObj
    set compObj [IDE::Component getCompObjectForName TestCase]
    my addSampleObjects $compObj
    my addSampleTclProcsGroup $compObj
    
    IDE::ComponentPersistence importComponent [$compObj getName]
}
