IDE::StandardInstallation proc initInterface {} {
    if {![catch {Sqlinterface loadInterface sqlite}]} {
        return 0
    }
    IDEPreferences setParameter interface sqlite
    return 1
}
