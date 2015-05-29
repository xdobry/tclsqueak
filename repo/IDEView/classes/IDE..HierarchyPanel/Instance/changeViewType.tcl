IDE::HierarchyPanel instproc changeViewType {} {
    my instvar hclassview hierarchyType
    $hclassview set vtype $hierarchyType
    $hclassview refresh
}
