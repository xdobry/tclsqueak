IDE::PersistentUIStateSupport proc getUIStateAll {} {
    set states [list]
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    foreach pclass [$introProxy getSubclassesDeep IDE::PersistentUIStateSupport] {
        foreach c [$pclass info instances] {
            set s [$c getUIState]
            if {[llength $s]>0} {
                lappend states $s
            }
        }
    }
    return $states
}
