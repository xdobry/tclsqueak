IDE::ComponentConfWrapper proc initDescriptor {} {
    set des [IDE::DBMapping [self]::descriptor -table Component -idColumn componentid -cached 1]
    $des addColumn {name varchar(50)}
    $des addColumn {defcounter int}
    $des addColumn {basedon int}
    $des addColumn {timest timestamp(14) getTimeStamp setTimeStamp}
    $des addColumn {versioninfo varchar(30)}
    $des addColumn {userid int getUserId}
    $des addColumn {isclosed bool}
}
