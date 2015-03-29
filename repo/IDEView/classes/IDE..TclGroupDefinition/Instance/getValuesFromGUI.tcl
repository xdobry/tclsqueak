IDE::TclGroupDefinition instproc getValuesFromGUI {} {
    my instvar win groupName
    set groupName [$win.fname.name get]
    if {$groupName eq ""} {
        IDE::Dialog error "You must specify new name for the tcl group"
        return 0
    }
    return 1
}
