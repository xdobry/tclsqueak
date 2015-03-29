IDE::NSBrowser proc newBrowserForInterp interp {
    set introProxy [IDE::NSIntroProxyInterp new -interp $interp]
    my newBrowserWithIntroProxy $introProxy
}
