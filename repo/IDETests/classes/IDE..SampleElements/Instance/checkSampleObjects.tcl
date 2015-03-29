IDE::SampleElements instproc checkSampleObjects compobj {
    set classes [$compobj getClasses]
    my assert {[ide::lcontain $classes TestA]}
    my assert {[ide::lcontain $classes TestB]}
    my assert {[ide::lcontain [$compobj getObjects] TestC]}
    my assert {[Object isclass TestA]}
    my assert {[Object isclass TestB]}
    my assert {[Object isobject TestC]}
    my assert {[TestB info superclass] eq "::TestA"}
    set met [TestA info instprocs]
    my assert {[ide::lcontain $met m1]}
    my assert {[ide::lcontain $met m2]}
    set met [TestB info instprocs]
    my assert {[ide::lcontain $met m1]}
    my assert {[ide::lcontain $met m2]}
    set met [TestC info procs]
    my assert {[ide::lcontain $met m1]}
    my assert {[ide::lcontain $met m2]}
}
