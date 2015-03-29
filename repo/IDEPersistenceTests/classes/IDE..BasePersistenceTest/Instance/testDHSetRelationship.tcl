IDE::BasePersistenceTest instproc testDHSetRelationship {} {
    my instvar s1 s2
    IDE::SimplePersistenceClass::descriptor createRelationshipProxies $s2
    ${s2}::childsamples setList $s1
    ${s2}::childsamples updateList
    my assert {[${s2}::childsamples getList]==$s1}
}
