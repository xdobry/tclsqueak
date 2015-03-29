IDE::ObjectBrowser instproc browseClass args {
    my instvar vobject
    if {[$vobject info class] ne "::xotcl::Object"} {
        IDE::HeritageBrowser newBrowser [$vobject info class]
    }
}
