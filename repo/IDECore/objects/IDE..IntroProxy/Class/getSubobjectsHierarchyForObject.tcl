IDE::IntroProxy proc getSubobjectsHierarchyForObject object {
    set hlist [$object]
    foreach sobject [lsort [$object info children]] {
	lappend hlist [my getSubobjectsHierarchyForObject $sobject]
    }
    return $hlist
}
