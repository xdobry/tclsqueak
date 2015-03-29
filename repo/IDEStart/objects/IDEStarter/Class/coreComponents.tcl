IDEStarter proc coreComponents {} {
    return [concat [my baseComponents] {
        IDEPersistence
        IDEPersistenceGUI
        IDEPersistenceAdd
        }]
}
