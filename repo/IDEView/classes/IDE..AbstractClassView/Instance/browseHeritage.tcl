IDE::AbstractClassView instproc browseHeritage actual {
    set introProxy [my getIntroProxy]
    if {[$introProxy isObjectClass $actual]} {
        IDE::HeritageBrowser newBrowser $actual $introProxy
    } else {
        my upsMessage "$actual is not a class"
    }
}
