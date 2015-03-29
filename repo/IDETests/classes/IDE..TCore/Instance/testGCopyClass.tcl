IDE::TCore instproc testGCopyClass {} {
    my instvar obj
    $obj copyClassOrObject TestA TestACopy
    my assert {[Object isclass TestACopy]}
    set met [TestACopy info instprocs]
    my assert {[ide::lcontain $met m1]}
    my assert {[ide::lcontain $met m2]}
}
