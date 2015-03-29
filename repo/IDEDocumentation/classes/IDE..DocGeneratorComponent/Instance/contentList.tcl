IDE::DocGeneratorComponent instproc contentList args {
    my instvar componentObj
    set text {}
    set ind 0
    foreach class [lsort [$componentObj getClasses]] {
        if {!$ind} {
            append text "Classes <ul>\n"
            set ind 1
        }
        append text "<li>[my localLinkToObject $class]</li>\n"
    }
    if {$ind} {
        append text "</ul> \n"
        append text "Classes Hierarchy <ul>\n"
        foreach tree [$componentObj getClassesHierarchy] {
            append text [my makeClassesHierarchyList $tree]
        }
        append text "</ul>\n"
    }
    set ind 0
    foreach object [lsort [$componentObj getObjects]] {
        if {!$ind} {
            append text "Objects <ul>\n"
            set ind 1
        }
        append text "<li>[my localLinkToObject $object]</li>\n"
    }
    if {$ind} {append text {</ul>} \n}
    set ind 0
    foreach pgroup [lsort [$componentObj getProcsGroups]] {
        if {!$ind} {
            append text "Procsgroups <ul>\n"
            set ind 1
        }
        append text "<li><a href=\"#pgroup_$pgroup\">$pgroup</a></li>\n"
    }
    if {$ind} {append text {</ul>} \n}
    return $text
}
