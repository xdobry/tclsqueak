IDE::Debugger instproc inspectCalledObject {} {
    my instvar objectList entryLevel realLevel
    set calledIndex  [expr {$entryLevel-$realLevel}]
    set obj [lindex $objectList $calledIndex]
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $obj]
    if {$introProxy ne ""} {
        IDE::ObjectBrowser newBrowser $obj $introProxy
    }
}
