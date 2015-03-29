IDE::ObjectDescription proc initDescriptor {} {
    set des [IDE::DBMapping create [self]::descriptor -table Object -idColumn objectid -type Type]
    $des addColumn {name varchar getObjectName _}
    $des addColumn {defbody varchar getDefBody setDefBody}
    $des addColumn {metadata varchar getMetadataText setMetadataText}
    $des addColumn {basedon int}
    $des addColumn {type enum('Class','Object','ProcsGroup') getType _}
    $des addColumn {timest timestamp(14) getTimeStamp setTimeStamp}
    $des addColumn {versioninfo varchar(30)}
    $des addColumn {userid int getUserId}
    $des addColumn {isclosed bool}
    IDE::DBInfo addInfoToDescriptor $des

    $des set weakRelationship [IDE::DBRelMappingNM new -childof $des -name ObjectMethod -targetClass IDE::MethodDescription -relationTable ObjectMethod -sourceName objectid -targetName methodid]
}
