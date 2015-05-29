IDE::TPersistenceNew instproc endTest {} {
    my instvar compName className className2

    if {![IDE::System isDatabase]} return
    IDE::ComponentPersistence removeForEver $compName
    set c [IDE::Component getCompObjectForNameIfExist $compName]
    if {$c ne ""} {
        $c unload
    }
    if {[Object isobject $className]} {
        $className destroy
    }
    if {[Object isobject $className2]} {
        $className2 destroy
    }
    if {[namespace exists ::testns]} {
        namespace delete ::testns
    }
    #file delete -force [my getFileName]
}
