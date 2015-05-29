IDE::System proc showHierarchy {class introProxy {type heritage}} {
    if {$type eq "heritage"} {
        IDE::HeritageBrowser newBrowser $class $introProxy
    } else {
        IDE::HeritageBrowser newBrowserChild $class $introProxy
    }
}
