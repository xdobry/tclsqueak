IDE::Deployer instproc setIsXOTclCode {} {
    my instvar isXOTclcode
    if {![IDE::SystemConfigMap exists componentsToLoad]} {
        return
    }
    set isXOTclcode 0
    foreach comp [IDE::SystemConfigMap set componentsToLoad] {
        set name [lindex $comp 0]
        set cobj [IDE::Component getCompObjectForNameIfExist $name]
        if {$cobj ne ""} {
            if {[llength [$cobj getObjects]]>0 || [llength [$cobj getClasses]]>0} {
                set isXOTclcode 1
                break
            }
        }
    }
}
