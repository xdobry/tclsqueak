IDE::ComponentPersistence proc initDescriptor {} {
    set des [IDE::DBMapping create [self]::descriptor -table Component -idColumn componentid]
    $des addColumn {name varchar(50) getName _}
    $des addColumn {defcounter int}
    $des addColumn {basedon int}
    $des addColumn {timest timestamp(14) getTimeStamp setTimeStamp}
    $des addColumn {versioninfo varchar(30)}
    $des addColumn {userid int getUserId}
    $des addColumn {isclosed bool}
    $des addColumn {ootype varchar(20) getOOType _}
    IDE::DBInfo addInfoToDescriptor $des

    $des set weakRelationship [IDE::DBRelMappingNM new -childof $des -name ComponentObject -targetClass IDE::ObjectDescription -relationTable ComponentObject -sourceName componentid -targetName objectid -orderIndexName deforder]

    $des set requireRelationship [IDE::DBRelMappingNM new -childof $des -name ComponentRequire -relationTable ComponentRequire -sourceName componentid -targetName name]
}
