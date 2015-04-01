IDE::WikiScriptsBrowser instproc initProxySetting {} {
    my instvar proxyHost proxyPort
    if {[Object isobject IDEPreferences]} {
        set proxyHost [IDEPreferences getParameter httpProxy]
        set proxyPort [IDEPreferences getParameter httpProxyPort]
    } else {
        set proxyHost ""
        set proxyPort ""
    }
}
