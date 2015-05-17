IDE::ObjectBrowser instproc browseClass args {
    my instvar vobject introProxy
    set oclass [$introProxy getClassForObject $vobject]
    if {$oclass ne "" && ![$introProxy isRootClass $oclass]} {
        IDE::HeritageBrowser newBrowser $oclass $introProxy
    }
}
