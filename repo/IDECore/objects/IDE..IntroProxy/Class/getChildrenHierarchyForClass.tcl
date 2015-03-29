IDE::IntroProxy proc getChildrenHierarchyForClass class {
    set hlist [$class]
    foreach sclass [$class info subclass] {
	lappend hlist [my getChildrenHierarchyForClass $sclass]
    }
    return $hlist
}
