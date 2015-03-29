IDE::SystemConfigMap proc loadComponentFromAny component {
    if {[IDE::Component getCompObjectForNameIfExist $component] ne ""} {
        return 1
    }
    set loadList [my getCleanedLoadList $component]
    my loadComponentsFromList $loadList
    return 1
}
