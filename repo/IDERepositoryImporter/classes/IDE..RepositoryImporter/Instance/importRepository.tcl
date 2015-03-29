IDE::RepositoryImporter instproc importRepository {} {
    my instvar exportRepository importRepository win
    if {![my isConnectedRepository]} {
        IDE::Dialog message "Connect to repository first"
        return
    }
    set importRepository [IDE::DBPersistence set connection]
    set sconfigmap  [[self]::configmaps selectedItemFirst]
    if {$sconfigmap ne ""} {
        set configmapid [lindex $sconfigmap 0]
    } else {
        return
    }
    my importConfigmap $configmapid
    IDE::Dialog message "configmap has been imported"
}
