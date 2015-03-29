IDE::ComponentPersistence proc loadVersionId componentId {
    IDE::Transcript warning "...loading from DB component $componentId"
    set requiredList [IDE::ComponentPersistence rekRequirementsList $componentId {}]
    if {$requiredList eq "_forgetit"} {
        IDE::Dialog message "Failed to load the component"
        return
    }
    foreach item $requiredList {
        set name [lindex $item 0]
        set version [lindex $item 1]
        IDE::Transcript warning "...loading because required $name $version"
        set instance [[self]::descriptor createInstanceFromDB [self] $version]
        $instance loadAllObjects
        $instance readRequiredFromDB
        lappend instances $instance
    }

    set instance [[self]::descriptor createInstanceFromDB [self] $componentId]
    $instance loadAllObjects
    $instance readRequiredFromDB
    lappend instances $instance

    return $instances
}
