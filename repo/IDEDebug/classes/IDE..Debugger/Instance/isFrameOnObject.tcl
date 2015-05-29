IDE::Debugger instproc isFrameOnObject {} {
    my instvar objectList entryLevel realLevel
    set calledIndex  [expr {$entryLevel-$realLevel}]
    set obj [lindex $objectList $calledIndex]
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $obj]
    expr {$introProxy ne ""}
}
