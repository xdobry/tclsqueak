IDE::StandardInstallation proc install {} {
    my loadPackages
    if {![my initInterface]} {
        return 0
    }
    my initPersistence
    my installComponents
    IDEPreferences setParameter startDefault 1
    IDEPreferences savePreferences
    return 1
}
