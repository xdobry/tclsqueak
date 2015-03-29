IDE::BasePersistenceTest instproc testCHReread {} {
    my instvar s1
    set olds1 $s1
    set id [$s1 set sampleid]
    $s1 destroy
    set s1 [IDE::SimplePersistenceClass::descriptor createInstanceFromDB IDE::SimplePersistenceClass $id]
    my assert {[$s1 set name] eq "sample1"}
    my assert {$s1!=$olds1}
}
