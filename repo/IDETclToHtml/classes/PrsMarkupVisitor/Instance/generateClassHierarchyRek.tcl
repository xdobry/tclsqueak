PrsMarkupVisitor instproc generateClassHierarchyRek {hierarchyOut rootObject objArr_ref superArr_ref} {
    upvar $objArr_ref objArr
    upvar $superArr_ref superArr
    $hierarchyOut puts <li>
    if {![catch {set objArr($rootObject)} rootDesc]} {
        lassign $rootDesc r defFileName superclasses
        $hierarchyOut puts "<a href=\"[my fileToHtmlFile $defFileName]#r$r\">$rootObject</a>"
    } else {
        $hierarchyOut puts $rootObject
    }
    if {![catch {set superArr($rootObject)} subclasses]} {
        $hierarchyOut puts <ul>
        foreach s $subclasses {
            my generateClassHierarchyRek $hierarchyOut $s objArr superArr
        }
        $hierarchyOut puts </ul>
    }
    $hierarchyOut puts </li>
}
