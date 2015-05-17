IDE::System proc saveIDEState {} {
    set prefDir [IDEPreferences initAndgetPrepDirectory]
    # which core components to load (what with plugins)
    set loadedRepoComps [list]
    set compNames [list]
    foreach comp [[IDE::XOIntroProxy getIntroProxy] getComponentsNoIDE] {
        set cobj  [IDE::Component getCompObjectForNameIfExist $comp]
        if {$cobj ne "" && [$cobj isPersistent]} {
            lappend compNames $comp
        }
    }
    foreach comp [my orderComponentsOnDependencies [lsort $compNames]] {
        set cobj [IDE::Component getCompObjectForNameIfExist $comp]
        if {$cobj ne ""} {
            lappend loadedRepoComps $comp [$cobj getIdValue]
        }
    }
    set statedic [dict create loadedcomponents $loadedRepoComps]
    dict set statedic uistate [IDE::PersistentUIStateSupport getUIStateAll]
    my saveDicTo $statedic [file join $prefDir idestate.data]
}
