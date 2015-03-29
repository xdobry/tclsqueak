IDE::ConfigurationBrowser instproc updateCompList {} {
    IDE::SystemConfigMap setValueForType componentsToLoad [[self]::confapp getList]
}
