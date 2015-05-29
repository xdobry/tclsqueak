IDE::CompBrowser instproc showHierarchy {class introProxy type} {
    my instvar win
    set toolPanel [my showToolPanel]
    #ttc vartype toolPanel xotcl IDE::TabPanel
    set hierarchyPanel [self]::@hierarchypanel
    #ttc vartype hierarchyPanel xotcl IDE::HierarchyPanel
    if {![Object isobject $hierarchyPanel]} {
        IDE::HierarchyPanel create $hierarchyPanel $win.hierarchypanel
    }
    $hierarchyPanel showHierarchy $class $introProxy $type
    $toolPanel addPanel $hierarchyPanel
}
