IDE::TPersistence instproc testFDredefineObjects {} {
    my instvar compObj
    namespace eval :: {
         TestA superclass TestD
    }
    if {[[$compObj getObject TestA] set deforder]<[[$compObj getObject TestD] set deforder]} error

}
