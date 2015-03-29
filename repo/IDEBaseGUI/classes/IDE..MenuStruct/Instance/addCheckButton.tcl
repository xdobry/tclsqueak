IDE::MenuStruct instproc addCheckButton {name variable {command {}}} {
    my addMenuItem [IDE::MenuCheckbox new -childof [self] -name $name -command $command -varname $variable]

}
