IDE::PackageLoader instproc selectVersion version {
    my set selectedVersion $version
    my instvar win
    foreach w {load loadDirect loadWS searchRequirements} {
        $win.buttons.$w configure -state normal
    }
}
