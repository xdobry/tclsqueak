IDE::MenuStruct instproc addCommand3 {name command {enable {}}} {
    my addMenuItem [IDE::MenuCommand new -childof [self] -name $name -command $command -popdownMenu 0 -enableList $enable]
}
