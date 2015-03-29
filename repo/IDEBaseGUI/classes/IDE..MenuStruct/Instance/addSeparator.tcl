IDE::MenuStruct instproc addSeparator {} {
    my addMenuItem [IDE::MenuSeparator new -childof [self]]
}
