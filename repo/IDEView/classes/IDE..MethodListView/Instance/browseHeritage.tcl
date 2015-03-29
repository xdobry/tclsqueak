IDE::MethodListView instproc browseHeritage item {
    lassign [my getDescFromItem $item] vclass vtype method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vtype]
    if {[$introProxy isObjectClass $vclass]} {
        IDE::HeritageBrowser newBrowser $vclass $introProxy
    } else {
        my upsMessage "$vclass is not a class"
    }
}
