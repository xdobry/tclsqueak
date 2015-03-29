IDE::MenuStruct instproc addCommand2 {name command {enable {}}} {
    my addMenuItem [IDE::MenuCommand new -childof [self] -name $name -command $command -popdownMenu 1 -enableList $enable]
}
