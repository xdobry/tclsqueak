IDEStarter proc invokeMenu {} {
    if {[winfo exists .startmenu]} {
        ::destroy .startmenu
    }
    switch [my set idestart] {
        1 {
            package require IDECore
            package require IDEBaseGUI
            package require IDEView
            package require IDETclParser
            package require IDEEditor
            package require IDEDebug
            package require IDEErrorReporter
            my startIDEOnly
        }
        2 {
            package require IDECore
            package require IDEBaseGUI
            package require IDEView
            package require IDETclParser
            package require IDEEditor
            package require IDEDebug
            package require IDEErrorReporter

            package require xdobry::sql
            package require IDEPersistence
            package require IDEPersistenceGUI
            package require IDEPersistenceAdd
            my startIDEWithDB
        }
        3 {
            package require xdobry::sql
            my startIDEFromDB
        }
        4 {
            package require IDEVCInstaller
            package require IDEBaseGUI
            package require IDEView
            package require xdobry::sql

            IDE::InstallerGUI create installer .
        }
    }
}
