IDE::ComponentPersistence proc loadNameVersionId {name componentId {compObj {}}} {
    set cobj [IDE::Component getCompObjectForNameIfExist $name]
    if {$cobj eq ""} {
        my loadVersionId $componentId
    } else {
        if {![$cobj isPersistent]} {
            IDE::Dialog message "The component $name is already loaded but not persistent. The loading and version changing is not possible. Try to unload the component first and try again";
            return
        }
        if {[$cobj getIdValue]!=$componentId} {
            $cobj rereadForAnotherVersion $componentId
        } else {
            IDE::Transcript warning "Component $name $componentId is currently loaded. Nothing to do!"
        }
    }
}
