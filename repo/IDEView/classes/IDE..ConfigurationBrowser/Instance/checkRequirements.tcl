IDE::ConfigurationBrowser instproc checkRequirements {} {
    [self]::confapp unselect
    set res  [IDE::SystemConfigMap checkRequirements [[self]::confapp getList]]
    my unselectComponent
    if {$res ne ""} {
        [self]::confapp setListUnsorted $res
    }
}
