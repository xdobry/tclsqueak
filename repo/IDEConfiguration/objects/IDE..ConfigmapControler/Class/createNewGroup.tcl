IDE::ConfigmapControler proc createNewGroup {} {
    my instvar configmapArr
    set name [IDE::IDialogEntry getValueWithCancel "give name for new config map"]
    if {$name eq "_cancel" || $name eq ""} return
    if {[ide::lcontain [array names configmapArr] $name]} {
        IDE::Dialog error "the name $name already exists"
        return
    }
    set inst [IDE::ConfigurationMap new -name $name]
    $inst makePersistent
    ide::addToValueForKey configmapArr $name $inst
    my lappend configmapGroups [IDE::ConfigurationMapGroup new -name $name]
    my refreshGroupView
}
