IDE::ConfigurationMap proc initDescriptor {} {
    set des [IDE::DBMapping [self]::descriptor -table Configmap -idColumn configmapid -cached 1]
    $des addColumn {name varchar(50) name name}
    $des addColumn {basedon int}
    $des addColumn {timest timestamp(14) getTimeStamp setTimeStamp}
    $des addColumn {versioninfo varchar(30)}
    $des addColumn {userid int getUserId}
    $des addColumn {isclosed bool}
    $des addColumn {prescript text}
    $des addColumn {postscript text}
    IDE::DBInfo addInfoToDescriptor $des
    
    $des addRelationship [IDE::DBRelMappingNM new -childof $des -name childconigmaps -targetClass IDE::ConfigurationMap -relationTable ConfigmapChildren -sourceName configmapid -targetName configmapchildid -orderIndexName loadorder]

    $des addRelationship [IDE::DBRelMappingNM new -childof $des -name components -targetClass IDE::ComponentConfWrapper -relationTable ConfigmapComponent -sourceName configmapid -targetName componentid -orderIndexName loadorder]
}
