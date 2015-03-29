IDE::ConfigurationBrowser instproc changeViewType type {
    my set vtype $type
    [self]::configedit setTextControler [IDE::SystemConfigMap getValueForType $type] [self]
}
