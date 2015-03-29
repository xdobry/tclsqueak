IDE::InstallerGUI instproc setInterface {} {
    my instvar interface connection
    IDEPreferences setParameter interface $interface
    set connection [[Sqlinterface loadInterface $interface] new]
}
