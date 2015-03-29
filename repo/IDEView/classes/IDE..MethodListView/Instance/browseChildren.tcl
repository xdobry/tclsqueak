IDE::MethodListView instproc browseChildren item {
    lassign [my getDescFromItem $item] vclass vtype method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vtype]
    if {[$introProxy isObjectClass $vclass]} {
        IDE::HeritageBrowser newBrowserChild $vclass $introProxy
    } else {
        my upsMessage "$vclass is not a class"
    }
}
