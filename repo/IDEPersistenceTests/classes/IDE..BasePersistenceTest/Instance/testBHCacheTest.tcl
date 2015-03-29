IDE::BasePersistenceTest instproc testBHCacheTest {} {
    my instvar s1 s2
    set s1p [IDE::SimplePersistenceClass::descriptor createInstanceFromDB IDE::SimplePersistenceClass [$s1 set sampleid]]
    my assert {$s1p==$s1}
}
