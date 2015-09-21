IDE::TAppWizard instproc testXOTclGUIApp {} {
    my instvar component class
    
    set builder [IDE::GuiClassBuilder new -childof [self]]
    set desc [$builder getDescription]
    
    set class MyGUITestClass
    set component MyGUIComponentUT
    set bparam [dict create Component $component Class $class namespace {} ooSystemType XOTcl]
    $builder build $bparam
    
    set compObj [IDE::Component getCompObjectForNameIfExist $component]
    my assert {$compObj ne ""}
    my assert {[Object isclass $class]}
    
    set instance [$class openNewWindow]
    after 1000
    update idletasks
    $instance destroy
    
    my endTest
}
