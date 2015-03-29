IDE::MethodDescription proc initDescriptor {} {
    set des [IDE::DBMapping create [self]::descriptor -table Method -idColumn methodid -type type]
    $des addColumn {name varchar(50) getName _}
    $des addColumn {body text getBody _}
    $des addColumn {type enum('Class','Instance') getType _}
    $des addColumn {objectname varchar(50) getObjectName _}
    $des addColumn {category varchar(50) getCategory setCategory}
    $des addColumn {basedon int}
    $des addColumn {timest timestamp(14) getTimeStamp setTimeStamp}
    $des addColumn {userid int getUserId}
    $des addColumn {versioninfo varchar(30)}
    IDE::DBInfo addInfoToDescriptor $des
}
