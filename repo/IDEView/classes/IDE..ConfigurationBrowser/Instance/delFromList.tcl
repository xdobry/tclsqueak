IDE::ConfigurationBrowser instproc delFromList {} {
    set sitem [[self]::confapp selectedItem]
    if {$sitem ne ""} {
        [self]::confapp removeItem $sitem
    }
    my unselectComponent
}
