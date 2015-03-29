IDE::MenuStruct instproc addRadioButton {name variable command value} {
    my addMenuItem [IDE::MenuRadiobutton new -childof [self] -name $name -command $command -varname $variable -value $value]
}
