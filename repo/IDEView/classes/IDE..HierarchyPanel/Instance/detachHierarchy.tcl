IDE::HierarchyPanel instproc detachHierarchy {} {
    my instvar currentItem hierarchyType
    if {$currentItem ne ""} {
        lassign $currentItem class introProxy type
        if {$hierarchyType eq "children"} {
            IDE::HeritageBrowser newBrowserChild $class $introProxy
        } else {
            IDE::HeritageBrowser newBrowser $class $introProxy
        }
    }
}
