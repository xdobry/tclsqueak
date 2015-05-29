IDE::AbstractClassView instproc browseChildren current {
    set introProxy [my getIntroProxy]
    if {[$introProxy isObjectClass $current]} {
        [my getViewMaster] showHierarchy $current $introProxy children
    } else {
        my upsMessage "$current is not a class"
    }
}
