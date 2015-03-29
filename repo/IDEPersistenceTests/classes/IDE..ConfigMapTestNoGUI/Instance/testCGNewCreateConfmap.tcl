IDE::ConfigMapTestNoGUI instproc testCGNewCreateConfmap {} {
    my instvar confmap
    set confmap [IDE::ConfigurationMap new -name TestConfMap]
    $confmap makePersistent
}
