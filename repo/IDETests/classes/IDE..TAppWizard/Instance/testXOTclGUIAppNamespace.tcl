IDE::TAppWizard instproc testXOTclGUIAppNamespace {} {
    my instvar component class
    
    set builder [IDE::GuiClassBuilder new -childof [self]]
    set desc [$builder getDescription]
    
    set namespace wtns
    set class MyGUITestClass
    set component MyGUIComponentUT
    set bparam [dict create Component $component Class $class ooSystemType XOTcl namespace $namespace]
    $builder build $bparam
    
    set compObj [IDE::Component getCompObjectForNameIfExist $component]
    set fullClass ::${namespace}::$class
    my assert {$compObj ne ""}
    my assert {[Object isclass $fullClass]}
    my assert {[namespace exists ::$namespace]}
    
    set instance [$fullClass openNewWindow]
    after 1000
    update idletasks
    $instance destroy
    
    my endTest
}
