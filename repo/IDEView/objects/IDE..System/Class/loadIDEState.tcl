IDE::System proc loadIDEState {} {
    set prefDir [IDEPreferences initAndgetPrepDirectory]
    set statefile [file join $prefDir idestate.data]
    if {[file isfile $statefile] && [IDE::System isDatabase]} {
        set dic [my loadFromDic $statefile]
        if {[dict exists $dic loadedcomponents]} {
            set loadedRepoComps [dict get $dic loadedcomponents]
            set loaded 0
            foreach {compName compId} $loadedRepoComps {
                set cobj [IDE::Component getCompObjectForNameIfExist $compName]
                if {$cobj eq ""} {
                    foreach row [IDE::ComponentPersistence getVersionsForName $compName] {
                        # check if name and compid match (otherwise repository was rebuild or moved
                        if {[lindex $row 0] == $compId} {
                            IDE::ComponentPersistence loadNameVersionId $compName $compId {}
                            set loaded 1
                            break
                        }
                    }
                }
            }
            if {$loaded} {
                IDE::System signalComponentsChanged
            }
        }
        if {[dict exists $dic uistate]} {
            IDE::PersistentUIStateSupport restoreUIFrom [dict get $dic uistate]
        }
    }
}
