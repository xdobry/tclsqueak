IDE::ErrorStack instproc inspectObjectFromStack level {
    my instvar objectsList
    set obj [lindex $objectsList $level]
    if {[Object isobject $obj]} {
        $obj inspect
    } elseif {$obj ne ""} {
        IDE::Dialog message "$obj is not xotcl Object"
    }
}
