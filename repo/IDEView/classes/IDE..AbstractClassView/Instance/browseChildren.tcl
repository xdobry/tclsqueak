IDE::AbstractClassView instproc browseChildren actual {
    set introProxy [my getIntroProxy]
    if {[$introProxy isObjectClass $actual]} {
        IDE::HeritageBrowser newBrowserChild $actual $introProxy
    } else {
        my upsMessage "$actual is not a class"
    }
}
