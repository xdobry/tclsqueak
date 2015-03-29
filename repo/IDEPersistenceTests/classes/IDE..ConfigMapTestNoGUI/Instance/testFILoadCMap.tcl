IDE::ConfigMapTestNoGUI instproc testFILoadCMap {} {
    my instvar confmap cwrap configmapid
    set confmap [IDE::ConfigurationMap::descriptor createInstanceFromDB IDE::ConfigurationMap $configmapid]
    set cwrap [$confmap getComponents]
    my assert {[llength $cwrap]==1}
    my assert {[$cwrap name] eq "TestCase"}
    my assert {[$cwrap isActualLoaded]}
}
