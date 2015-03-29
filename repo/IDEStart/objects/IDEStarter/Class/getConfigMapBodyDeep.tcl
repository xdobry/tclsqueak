IDEStarter proc getConfigMapBodyDeep id {
    set script {}
    foreach child [my getSubconfigsForId $id] {
        append script "# Subconfigmap [lindex $child 0]\n"
        append script [my getConfigMapBodyDeep [lindex $child 1]]
    }
    foreach component [my getComponentsForConfigmapId $id] {
        append script "# component [lindex $component 0]\n"
        append script [my getComponentBody [lindex $component 1]]
    }
    return $script
}
