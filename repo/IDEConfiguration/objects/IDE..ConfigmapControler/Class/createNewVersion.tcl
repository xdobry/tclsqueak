IDE::ConfigmapControler proc createNewVersion cmap {
    set inst [$cmap copyAndCreateNewEdition]
    ide::addToValueForKey configmapArr [$cmap name] $inst
    my selectGroup [my set selectedGroup]
}
