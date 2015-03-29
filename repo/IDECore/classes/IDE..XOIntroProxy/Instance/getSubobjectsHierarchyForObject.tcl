IDE::XOIntroProxy instproc getSubobjectsHierarchyForObject object {
    set hlist [list $object]
    foreach sobject [lsort [$object info children]] {
	lappend hlist [my getSubobjectsHierarchyForObject $sobject]
    }
    return $hlist
}
