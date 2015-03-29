IDE::SystemConfigMap proc getComponentsList {{ignoreLoaded 1}} {
    my instvar componentsToLoad
    if {![info exists componentsToLoad] || $componentsToLoad eq ""} return
    return [my getCleanedLoadList $componentsToLoad $ignoreLoaded]
}
