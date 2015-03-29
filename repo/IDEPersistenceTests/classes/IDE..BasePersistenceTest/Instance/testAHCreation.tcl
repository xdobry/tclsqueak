IDE::BasePersistenceTest instproc testAHCreation {} {
    my instvar s1 s2
    set s1 [IDE::SimplePersistenceClass new -name sample1]
    set s2 [IDE::SimplePersistenceClass new -name sample2]
    $s1 makePersistent
    $s2 makePersistent
    my assert {[$s1 exists sampleid]}
}
