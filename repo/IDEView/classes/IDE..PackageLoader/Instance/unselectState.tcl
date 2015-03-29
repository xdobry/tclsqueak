IDE::PackageLoader instproc unselectState {} {
    my instvar win
    foreach w {load loadDirect loadWS searchRequirements} {
        $win.buttons.$w configure -state disabled
    }
}
