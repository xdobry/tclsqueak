IDE::ConfigurationMap instproc openInConfigurationsMapBrowser {} {
    set llist [ide::lcollect each [my getComponents] {list [$each getName] [$each set componentid]}]
    IDE::SystemConfigMap setValueForType preStartScript [my set prescript]
    IDE::SystemConfigMap setValueForType startScript [my set postscript]
    IDE::SystemConfigMap setValueForType componentsToLoad $llist
    IDE::SystemConfigMap set configName [my set name]
    IDE::ConfigurationBrowser showBrowser
}
