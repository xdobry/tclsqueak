IDE::ConfigMapTestNoGUI instproc testBGComponentWrapper {} {
    my instvar cwrap cobj
    set cwrap [IDE::ComponentConfWrapper::descriptor createInstanceFromDB IDE::ComponentConfWrapper [$cobj set componentid]]
    my assert {[$cobj getName]==[$cwrap name]}
    my assert {[$cobj set componentid]==[$cwrap set componentid]}
    my assert {[$cobj set defcounter]==[$cwrap set defcounter]}
    #my assert {[$cobj set basedon]==[$cwrap set basedon]}
    #my assert {[$cobj set timestamp]==[$cwrap set timestamp]}
    my assert {[$cobj set versioninfo]==[$cwrap set versioninfo]}
    my assert {[$cobj set userid]==[$cwrap set userid]}
    #my assert {[$cobj set isclosed]==[$cwrap set isclosed]}
    
}
