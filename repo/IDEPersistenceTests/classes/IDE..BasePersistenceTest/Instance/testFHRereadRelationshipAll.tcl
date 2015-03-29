IDE::BasePersistenceTest instproc testFHRereadRelationshipAll {} {
    my instvar s1 s2
    set id [$s2 set sampleid]
    $s2 destroy
    $s1 destroy 
    set s2 [IDE::SimplePersistenceClass::descriptor createInstanceFromDB IDE::SimplePersistenceClass $id]
    my assert {[$s2 set name] eq "sample2"}
    set s1 [${s2}::childsamples getList]
    my assert {[$s1 set name] eq "sample1"}
}
