IDE::ClassView instproc moveToComp currentObject {
    my instvar vcomponent vclass cobj
    set component [IDE::ComponentChooser chooseComponent {Choose the component} [$cobj getOOType] [list $vcomponent]]
    if {$component ne ""} {
        if {$vcomponent eq $component} return
        # check if source and target component can be changed
        if {![my canModifyComponent]} return
        set ncobj [IDE::Component getCompObjectForName $component]
        if {[$ncobj isPersistent] && ![$ncobj questForChange]} return
        set introProxy [my getIntroProxy]
        $introProxy moveToComponent $vclass $component
        if {[$ncobj isPersistent]} {
            $ncobj reorderObjectDefinition
        }
        my removeItem $currentObject
    }
}
