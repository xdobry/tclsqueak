IDE::ComponentPersistence proc synchronizeCoreSystem {} {
    foreach comp [IDE::System getCoreComponents] {
        my synchronizeComponent $comp
    }
    if {[info procs ::repobs::main] ne ""} {
        IDE::Component getCompObjectForName IDERepoBootstrap
        IDE::ComponentPersistence synchronizeComponent IDERepoBootstrap
    }
}
