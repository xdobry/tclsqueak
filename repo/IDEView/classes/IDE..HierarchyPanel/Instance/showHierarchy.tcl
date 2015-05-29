IDE::HierarchyPanel instproc showHierarchy {class introProxy type} {
    my instvar hierarchyHistory
    lappend hierarchyHistory [list $class $introProxy $type]
    my displayHierarchy $class $introProxy $type
}
