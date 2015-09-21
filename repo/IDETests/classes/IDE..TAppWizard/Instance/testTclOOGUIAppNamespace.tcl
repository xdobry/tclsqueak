IDE::TAppWizard instproc testTclOOGUIAppNamespace {} {
    my instvar component class
    
    set builder [IDE::GuiClassBuilder new -childof [self]]
    set desc [$builder getDescription]
    
    set class MyGUITestClass
    set component MyGUIComponentUT
    set namespace mytestns
    set bparam [dict create Component $component Class $class ooSystemType TclOO namespace $namespace]
    $builder build $bparam
    
    set compObj [IDE::Component getCompObjectForNameIfExist $component]
    my assert {$compObj ne ""}
    my assert {[$compObj getOOType] eq "TclOO"}
    set fullClass ::${namespace}::$class
    my assert {[namespace exists ::$namespace]}
    my assert {[info object isa class $fullClass]}
    
    set instance [$fullClass openNewWindow]
    after 500
    update idletasks
    $instance destroy
    
    my endTest
}
