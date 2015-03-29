IDE::SimplePersistenceClass proc initDescriptor {} {
    set des [IDE::DBMapping [self]::descriptor -table Sample -idColumn sampleid -cached 1]
    $des addColumn {name varchar(50) name name}
    
    $des addRelationship [IDE::DBRelMappingNM new -childof $des -name childsamples -targetClass IDE::SimplePersistenceClass -relationTable SampleRel -sourceName sampleid -targetName samplechildid -orderIndexName loadorder]
}
