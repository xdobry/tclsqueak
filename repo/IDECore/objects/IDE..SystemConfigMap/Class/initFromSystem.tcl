IDE::SystemConfigMap proc initFromSystem {} {
    my instvar componentsToLoad
    set coreComps [IDE::System getCoreComponentsAll]
    set comps {}
    foreach comp [IDE::Component getComponentNames] {
        if {$comp ni $coreComps} {
            set cobj [IDE::Component getCompObjectForNameIfExist $comp]
            if {[$cobj isPersistent]} {
                append comps "{$comp [$cobj getIdValue]}\n"
            } else {
                append comps "{$comp package}\n"
            }
        }
    }
    set componentsToLoad $comps
}
