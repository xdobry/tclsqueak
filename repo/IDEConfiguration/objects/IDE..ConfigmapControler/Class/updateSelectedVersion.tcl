IDE::ConfigmapControler proc updateSelectedVersion {} {
    my instvar selectedVersion view
    if {$selectedVersion eq ""} return
    ${selectedVersion}::components updateList
    ${selectedVersion}::childconigmaps updateList
    set selectedVersion {}
}
