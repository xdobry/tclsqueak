IDE::BasePersistenceTest instproc testEHRereadRelationship {} {
    my instvar s1 s2
    set id [$s2 set sampleid]
    $s2 destroy
    set s2 [IDE::SimplePersistenceClass::descriptor createInstanceFromDB IDE::SimplePersistenceClass $id]
    my assert {[$s2 set name] eq "sample2"}
    my assert {[${s2}::childsamples getList]==$s1}
}
