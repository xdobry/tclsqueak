IDE::Debugger instproc inspectCalledObject {} {
    my instvar objectList entryLevel realLevel
    set calledIndex  [expr {$entryLevel-$realLevel}]
    set obj [lindex $objectList $calledIndex]
    if {[Object isobject $obj]} {
        $obj inspect
    }
}
