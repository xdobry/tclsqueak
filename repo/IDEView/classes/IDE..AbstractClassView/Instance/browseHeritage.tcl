IDE::AbstractClassView instproc browseHeritage current {
    set introProxy [my getIntroProxy]
    if {[$introProxy isObjectClass $current]} {
        [my getViewMaster] showHierarchy $current $introProxy heritage
    } else {
        my upsMessage "$current is not a class"
    }
    
}
