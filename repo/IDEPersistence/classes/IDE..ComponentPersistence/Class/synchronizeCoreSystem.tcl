IDE::ComponentPersistence proc synchronizeCoreSystem {} {
    foreach comp [IDE::System getCoreComponents] {
        my synchronizeComponent $comp
    }
}
