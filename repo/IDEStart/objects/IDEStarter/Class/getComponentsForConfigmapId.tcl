IDEStarter proc getComponentsForConfigmapId id {
    my instvar sqlhandle
    $sqlhandle queryList "SELECT cp.name,nm.componentid FROM ConfigmapComponent nm, Component cp WHERE cp.componentid=nm.componentid AND nm.configmapid=$id ORDER BY nm.loadorder"
}
