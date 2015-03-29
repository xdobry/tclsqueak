IDE::ConfigurationBrowser instproc initCompList {} {
    set list [IDE::SystemConfigMap getValueForType componentsToLoad]
    [self]::confapp setListUnsorted  [lrange $list 0 end]
}
