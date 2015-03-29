IDE::ConfigMapTestNoGUI instproc testDGAddComponents {} {
    my instvar confmap cwrap 
    $confmap setComponents $cwrap
    ${confmap}::components updateList
    my assert {![$confmap canVersion]}
}
