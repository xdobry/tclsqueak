IDE::ConfigMapTestNoGUI instproc testEILoadComponents {} {
    my instvar confmap cwrap cobj
    $cwrap load
    set ncobj [IDE::Component getCompObjectForNameIfExist TestCase]
    my assert {$ncobj ne ""}
    my assert {$cobj ne $ncobj}
    set cobj $ncobj
    my assert  {[$cwrap isActualLoaded]}
    
}
