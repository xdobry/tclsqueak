IDE::ConfigmapControler proc reloadConfigmaps {} {
    my selectGroup {}
    catch {
        my unset configmapGroups configmapArr componentGroups componentArr
    }
    IDE::ObjectCache destroyInstancesOfClass IDE::ConfigurationMap
    IDE::ObjectCache destroyInstancesOfClass IDE::ComponentConfWrapper
    my initConfigmaps
    my refreshGroupView
}
