IDE::TAppWizard instproc testTclOOGUIApp {} {
    my instvar component class
    
    set builder [IDE::GuiClassBuilder new -childof [self]]
    set desc [$builder getDescription]
    
    set class MyGUITestClass
    set component MyGUIComponentUT
    set bparam [dict create Component $component Class $class ooSystemType TclOO namespace {}]
    $builder build $bparam
    
    set compObj [IDE::Component getCompObjectForNameIfExist $component]
    my assert {$compObj ne ""}
    my assert {[$compObj getOOType] eq "TclOO"}
    my assert {[info object isa class $class]}
    
    set instance [$class openNewWindow]
    after 1000
    update idletasks
    $instance destroy
    
    my endTest
}
