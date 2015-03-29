IDEStarter proc getSubconfigsForId id {
    my instvar sqlhandle
    $sqlhandle queryList "SELECT cm.name,nm.configmapchildid FROM ConfigmapChildren nm, Configmap cm WHERE cm.configmapid=nm.configmapid AND nm.configmapid=$id ORDER BY nm.loadorder"
}
