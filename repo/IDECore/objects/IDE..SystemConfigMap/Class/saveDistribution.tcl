IDE::SystemConfigMap proc saveDistribution {{dir {}}} {
    my instvar componentsToLoad
    if {![info exists componentsToLoad] || $componentsToLoad eq ""} {
        IDE::Dialog message "The distribution must have at least on component"
        return
    }
    foreach comp $componentsToLoad {
        set name [lindex $comp 0]
        set cobj [IDE::Component getCompObjectForNameIfExist $name]
        if {$cobj eq ""} {
            IDE::Dialog message "$comp is not currently loaded. You can only maka a distribution from loaded components. Operation canceled"
            return
        }
    }
    IDE::DeployerUI newBrowser directory $componentsToLoad
}
