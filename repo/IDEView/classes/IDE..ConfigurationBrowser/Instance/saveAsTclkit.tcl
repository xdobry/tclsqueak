IDE::ConfigurationBrowser instproc saveAsTclkit {} {
    my updateCompList
    IDE::PlugInsManager loadExtras TclKitDeployer
}
