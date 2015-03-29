IDE::ConfigmapControler proc getActions {view element} {
    my instvar actionsMaps
    set actions {}
    set type [namespace tail $view]
    
    set desc $actionsMaps($type)
    
    foreach d $desc {
        foreach {action denab} $d {
            set state active
            foreach ed $denab {
                set state disabled
                switch $ed {
                    selection {
                        if {$element ne ""} {set state active}
                    }
                    isVersioned {
                        if {[$element set isclosed]} {set state active}
                    }
                    cmapIsEdition {
                        if {![[my set selectedVersion] isclosed]} {
                            set state active
                        }
                    }
                    selectVersion {
                        if {[my set selectedVersion] ne ""}  {set state active}
                    }
                    canVersion {
                        if {[$element canVersion]} {set state active}
                    }
                }
                if {$state eq "disabled"} break
            }
            lappend actions [list $action $state]
        }
    }
    return $actions
}
