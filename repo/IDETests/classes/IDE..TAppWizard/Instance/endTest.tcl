IDE::TAppWizard instproc endTest {} {
    my instvar component class
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj ne ""} {$cobj unload}
    if {[Object isclass $class]} {
        $class destroy
    }
}
