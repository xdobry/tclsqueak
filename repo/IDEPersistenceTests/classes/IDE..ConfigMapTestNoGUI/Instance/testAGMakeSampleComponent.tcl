IDE::ConfigMapTestNoGUI instproc testAGMakeSampleComponent {} {
    my instvar cobj
    set cobj [IDE::Component getCompObjectForName TestCase]
    my addSampleObjects $cobj
    
    IDE::ComponentPersistence importComponent [$cobj getName]
    my assert {[$cobj isPersistent]}
}
