IDE::XOIntroProxy instproc getUserRelevantComponents {} {
    if {[IDEPreferences getParameter ignoreIDEComponents]} {
        my getComponentsNoIDE
    } else {
        my getComponents
    }
}
