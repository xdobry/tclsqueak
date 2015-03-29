IDE::ConfigmapControler proc initConfigmaps args {
    my instvar configmapGroups configmapArr componentGroups componentArr
    if {[my exists configmapGroups]} return
    set configmaps [IDE::ConfigurationMap::descriptor createInstancesFromWhere IDE::ConfigurationMap {} {}]
    set configmapGroups {}
    if {$configmaps ne ""} {
        foreach cmap $configmaps {
            my addConfigmap $cmap
        }
        foreach name [lsort [array names configmapArr]] {
            lappend configmapGroups [IDE::ConfigurationMapGroup new -name $name]
        }
    }
    # load all components version
    set components [IDE::ComponentConfWrapper::descriptor createInstancesFromWhere IDE::ComponentConfWrapper {} {}]
    set componentGroups {}
    if {$components eq ""} return
    foreach comp $components {
        ide::addToValueForKeyAt componentArr [$comp set name] $comp 0
    }
    foreach name [lsort [array names componentArr]] {
        lappend componentGroups [IDE::ComponentGroup new -name $name]
    }
}
