IDE::ComponentPersistence instproc setVersionNumber number {
    my instvar versioninfo
    if {![regsub {(\[.*\]\s*)([0-9]+)(.[0-9]+)?} $versioninfo \\1$number nversion]} {
        set nversion $number
    }
    my setVersionInfo $nversion
}
