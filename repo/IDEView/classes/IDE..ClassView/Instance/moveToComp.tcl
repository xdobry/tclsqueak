IDE::ClassView instproc moveToComp actual {
    my instvar vcomponent vclass
    IDE::IDialogList create [self]::dialog -message {Choose the Component}  -list [lsort [IDE::Component getComponentNames]]
    if {[[self]::dialog prompt] eq "ok"} {
        set component [[self]::dialog selectedItem]
        if {$vcomponent==$component} return
        # check if source and target component can be changed
        if {![my canModifyComponent]} return
        set cobj [IDE::Component getCompObjectForName $component]
        if {[$cobj isPersistent] && ![$cobj questForChange]} return
        if {$component ne ""} {
            set introProxy [my getIntroProxy]
            $introProxy moveToComponent $vclass $component
            if {[$cobj isPersistent]} {
                $cobj reorderObjectDefinition
            }
            my removeItem $actual
        }
    }
    [self]::dialog destroy
}
