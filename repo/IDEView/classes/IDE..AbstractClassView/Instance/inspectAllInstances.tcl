IDE::AbstractClassView instproc inspectAllInstances selected {
    set introProxy [my getIntroProxy]
    if {[$introProxy isObjectClass $selected]} {
        IDE::ObjectBrowser browseAllInstances $selected $introProxy
    } elseif {[$introProxy isObject $selected]} {
        IDE::ObjectBrowser newBrowser $selected $introProxy
    }
}
