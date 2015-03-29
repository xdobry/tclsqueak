IDE::ConfigurationBrowser instproc loadFromFile {} {
    my instvar vtype
    IDE::SystemConfigMap loadFromFile {}
    my initCompList
    my changeViewType $vtype
}
