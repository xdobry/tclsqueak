IDE::ConfigurationBrowser instproc addUnmanagedPackage {} {
    set package [IDE::IDialogEntry getValue "Specify a tcl package that can be loaded per.\n  package require\n and is not managed by xotclide.\nWarning no syntax checking are possible!"]
    if {$package ne ""} {
        [self]::confapp addItemAtTail $package
    }
}
