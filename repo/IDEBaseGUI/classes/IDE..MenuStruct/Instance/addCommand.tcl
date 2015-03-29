IDE::MenuStruct instproc addCommand {name command {underline {}} {accelerator {}} {popdownMenu 0} {enable {}}} {
    my addMenuItem [IDE::MenuCommand new -childof [self] [list -name $name] [list -command $command] [list -accelerator $accelerator] [list -underline $underline] [list -popdownMenu $popdownMenu] [list -enableList $enable]]
}
