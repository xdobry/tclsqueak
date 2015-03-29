IDE::OOPersistence instproc endTest {} {
    if {![IDE::System isDatabase]} return
    set compName testoocomp
    IDE::ComponentPersistence removeForEver $compName
    set c [IDE::Component getCompObjectForNameIfExist $compName]
    if {$c ne ""} {
        $c unload
    }
    if {[info object isa object TclOOTest]} {
        TclOOTest destroy
    }
    if {[info object isa object TclOOObject]} {
        TclOOObject destroy
    }

    set drepo [IDE::ObjectDescriptionsRepo getRepo]
    $drepo removeDescForObject TclOOTest
    $drepo removeDescForObject TclOOObject
}
