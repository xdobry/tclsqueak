IDE::HierarchyPanel instproc displayHierarchy {class introProxy type} {
    my instvar hclassview currentItem hierarchyType
    set currentItem [list $class $introProxy $type]
    $hclassview set vtype $type
    set hierarchyType $type
    $hclassview selectFor $class $introProxy
}
