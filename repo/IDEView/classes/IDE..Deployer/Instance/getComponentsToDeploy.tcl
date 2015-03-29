IDE::Deployer instproc getComponentsToDeploy {} {
    set compToSave {}
    if {![IDE::SystemConfigMap exists componentsToLoad] || [IDE::SystemConfigMap set componentsToLoad] eq ""} {
        if {![IDE::ConfigurationBrowser hasView]} {
            set result [IDE::Dialog yesNo "There are currently no components in configuration map that can be deployed. Do you want to start \"Configuration Map Browser\" and specify them"]
            if {$result} {
                IDE::ConfigurationBrowser showBrowser
            }
        } else {
            IDE::Dialog message "There are currently no components in configuration map that can be deployed. Please specify the components in \"Configuration Map Browser\" first"
        }
        return [list]
    }
    foreach comp [IDE::SystemConfigMap set componentsToLoad] {
        set name [lindex $comp 0]
        set cobj [IDE::Component getCompObjectForNameIfExist $name]
        if {$cobj eq ""} {
            IDE::Dialog message "$comp is not currently loaded. You can only maka a distribution from loaded components. Operation canceled"
            cd [my set old_dir]
            return
        }
        lappend compToSave $cobj
    }
    return $compToSave
}
