IDE::ComponentSaveWizard instproc setComponentList {} {
    my instvar compVisibility
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    if {!$compVisibility} {
        [self]::complist setList [$introProxy getComponents]
    } else {
        [self]::complist setList [$introProxy getComponentsNoIDE]
    }
}
