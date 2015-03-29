IDE::TPersistence instproc testGDReloadComponentEdition {} {
    my instvar compObj compId
    IDE::ComponentPersistence loadNameVersionId TestCase $compId {}
    my assert {[$compObj set componentid]==$compId}
    my testGBquestVersion
    # test add
    my assert {![ide::lcontain [$compObj getClasses] TestE]}
    # test remove
    my assert {[ide::lcontain [$compObj getClasses] TestB]}
    # test modify class
    # adding method
    my assert {[TestA info instprocs s1] eq ""}
    # deleting method
    my assert {[TestA info instprocs m2] ne ""}
}
