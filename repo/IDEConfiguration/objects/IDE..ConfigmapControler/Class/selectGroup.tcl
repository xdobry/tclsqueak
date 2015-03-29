IDE::ConfigmapControler proc selectGroup {{sgroup {}}} {
    my instvar selectedGroup configmapArr
    my selectVersion {}
    set selectedGroup $sgroup
    if {$selectedGroup eq ""} {
        [my set view]::versions setObjectsList {}
        return
    }
    [my set view]::versions setObjectsList $configmapArr([$sgroup name])
}
