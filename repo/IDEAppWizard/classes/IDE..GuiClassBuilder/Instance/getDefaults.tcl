IDE::GuiClassBuilder instproc getDefaults {{selectedComponent {}}} {
    set defaults [dict create Component MyUIComponent Class MyUIClass ooSystemType XOTcl createMain 1 windowTitle {my window} namespace {}]
    set i 1
    set classBase [dict get $defaults Class]
    if {$selectedComponent ne ""} {
        set idecomps [concat [IDE::System getCoreComponentsAll] [IDE::System getExtraComponents]]
        if {$selectedComponent ni $idecomps} {
            dict set defaults Component $selectedComponent
        }
    }
    set cobj [IDE::Component getCompObjectForNameIfExist [dict get $defaults Component]]
    if {$cobj ne ""} {
        dict set defaults ooSystemType [$cobj getOOType]
    }
    while {[IDE::XOIntroProxy getIntroProxyForObject [dict get $defaults Class]] ne ""} {
        dict set defaults Class $classBase$i
        incr i
    }
    return $defaults
}
