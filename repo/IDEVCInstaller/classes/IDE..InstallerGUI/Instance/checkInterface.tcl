IDE::InstallerGUI instproc checkInterface {} {
     my instvar win interface
     set lb $win.inputframe.listbox
     if {[set cur [$lb curselection]] eq ""} {
        my installError "select interface first"
        return 0
     }
     set interface [$lb get $cur]
     Sqlinterface loadInterface $interface
     return 1
}
