IDE::ConfigurationBrowser instproc setComponentList {} {
    my instvar compVisibility classView
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    if {!$compVisibility} {
        [self]::applist setList [$introProxy getComponents]
    } else {
        [self]::applist setList [$introProxy getComponentsNoIDE]
    }
}
