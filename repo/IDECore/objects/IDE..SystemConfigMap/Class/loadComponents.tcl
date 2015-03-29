IDE::SystemConfigMap proc loadComponents {} {
    my instvar componentsToLoad
    if {![info exists componentsToLoad] || $componentsToLoad eq ""} {
        IDE::Dialog message "Nothing to load. Create components list first or load a configuration map file"
        return
    }
    set loadList [my getCleanedLoadList $componentsToLoad]
    my loadComponentsFromList $loadList
}
