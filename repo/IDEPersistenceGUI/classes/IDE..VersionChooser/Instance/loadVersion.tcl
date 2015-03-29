IDE::VersionChooser instproc loadVersion {} {
    my set result [[self]::version getSelectedVersion]
    my signalFree
}
