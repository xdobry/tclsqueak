IDE::ConfigMapTestNoGUI instproc testFGUnloadCMap {} {
    my instvar confmap cwrap configmapid
    set configmapid [$confmap set configmapid]
    $confmap destroy
    $cwrap destroy
    
}
