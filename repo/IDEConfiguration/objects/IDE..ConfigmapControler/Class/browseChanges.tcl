IDE::ConfigmapControler proc browseChanges object {
    my instvar configmapArr view
    if {[llength $configmapArr([$object name])]==1} {
        IDE::Dialog message "No another edition to compare"
    }
    set newobject [IDE::EditionChooser getVersion $configmapArr([$object name]) $object]
    if {$newobject eq "" || $object==$newobject} return
    IDE::CMapsChangesBrowser compareCMaps $object $newobject
}
