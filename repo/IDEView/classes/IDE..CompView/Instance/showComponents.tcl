IDE::CompView instproc showComponents {} {
    if {[IDEPreferences getParameter ignoreIDEComponents]} {
        set introProxy [IDE::XOIntroProxy getIntroProxy]
        my setList [$introProxy getComponentsNoIDE]
    } else {
        set introProxy [IDE::XOIntroProxy getIntroProxy]
        my setList [$introProxy getComponents]
    }
}
