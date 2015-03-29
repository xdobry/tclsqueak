IDE::Debugger instproc displayIndex index {
    my instvar objectList
    set obj [lindex $objectList $index]
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $obj]
    if {$introProxy ne ""} {
        [self]::varsview selectFor $obj $introProxy
    }
    # triger local vars info. see method startBrowsing
    my set action [list [self] inspectLevel $index]
}
