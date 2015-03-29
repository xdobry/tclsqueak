IDE::ObjectBrowser instproc inspectParent {} {
    my instvar vobject introProxy
    if {[set parent [$vobject info parent]] ne "::" && [Object isobject $parent]} {
        my setViewObject $parent $introProxy
    } else {
        IDE::Dialog message "$vobject has no parent"
    }
}
