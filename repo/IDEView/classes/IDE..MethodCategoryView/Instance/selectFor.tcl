IDE::MethodCategoryView instproc selectFor {class objtype pintroProxy} {
    my instvar vclass win vobjtype viewtype selectAllByDefault introProxy
    set introProxy $pintroProxy
    set vclass $class
    if {$class eq ""} {
        my resetList
        [my info parent]::methodview selectFor {} {} $viewtype $introProxy
        return
    }
    if {$objtype eq "Procs"} {
        my resetList
        [my info parent]::methodview selectFor $class {} $objtype $introProxy
        set vobjtype $objtype
        [self]::stateButton setStates {}
        return
    }
    if {$vobjtype ne $objtype} {
        if {$objtype eq "Objects"} {
            [self]::stateButton setStates {Class}
            [self]::stateButton setStateAddInfo Instance "  "
        } elseif {$objtype eq "Classes"} {
            [self]::stateButton setStates {Instance Class}
        }
        set viewtype [[self]::stateButton state]
        set vobjtype $objtype
    }
    set allcatName [my refreshView]
    if {$selectAllByDefault} {
        my setSelectedItem $allcatName
    } else {
        my selectItem {}
    }
}
