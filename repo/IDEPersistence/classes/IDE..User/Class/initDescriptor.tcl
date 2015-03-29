IDE::User proc initDescriptor {} {
    set des [IDE::DBMapping create [self]::descriptor -table Userlib -idColumn userid -type Type]
    $des addColumn {name varchar}
    $des addColumn {longname varchar}
}
