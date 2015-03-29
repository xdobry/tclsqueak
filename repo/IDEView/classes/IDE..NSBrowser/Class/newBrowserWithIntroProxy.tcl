IDE::NSBrowser proc newBrowserWithIntroProxy introProxy {
    my new [Object autoname .nsbrowser] [list -introProxy $introProxy]
}
