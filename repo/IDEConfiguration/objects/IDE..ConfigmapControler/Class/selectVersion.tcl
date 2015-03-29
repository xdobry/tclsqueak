IDE::ConfigmapControler proc selectVersion {{sversion {}}} {
    my instvar selectedVersion view viewType
    my updateSelectedVersion
    set selectedVersion $sversion
    if {$selectedVersion eq ""} {
        ${view}::components setObjectsList {}
        ${view}::cmaps setObjectsList {}
        ${view}::text setText {}
        ${view}::text makeEmpty
    } else {
        ${view}::components setObjectsList [$sversion getComponents]
        ${view}::cmaps setObjectsList [$sversion getCMaps]
        my updateText
    }
}
