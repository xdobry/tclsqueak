IDE::MethodListView instproc browseChildren item {
    lassign [my getDescFromItem $item] vclass vtype method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vtype]
    if {[$introProxy isObjectClass $vclass]} {
        [my getViewMaster] showHierarchy $vclass $introProxy children
    } else {
        my upsMessage "$vclass is not a class"
    }
}
