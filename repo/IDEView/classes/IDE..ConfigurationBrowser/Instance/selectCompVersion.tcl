IDE::ConfigurationBrowser instproc selectCompVersion version {
    my instvar selectedCompItem
    if {$version eq "automatic"} {
        set new [lindex $selectedCompItem 0]
    } elseif {$version eq "package"} {
        set new [list [lindex $selectedCompItem 0] package]
    } else {
        set new [list [lindex $selectedCompItem 0] [lindex $version 0]]
    }
    [self]::confapp renameItemUnsorted $selectedCompItem $new
    set selectedCompItem $new
}
