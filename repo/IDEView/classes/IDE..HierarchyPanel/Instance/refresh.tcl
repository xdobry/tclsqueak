IDE::HierarchyPanel instproc refresh {} {
    my instvar currentItem
    if {$currentItem ne ""} {
        my displayHierarchy {*}$currentItem
    }
}
