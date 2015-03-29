IDEStarter proc startStandardSetup {} {
    package require IDEVCInstaller
    package require IDEBaseGUI
    package require IDEView
    package require xdobry::sql

    if {![IDE::StandardInstallation install]} {
        return 0
    }

    IDE::Dialog message "The XOTclIDE was setup. Please restart"
    exit 0
}
