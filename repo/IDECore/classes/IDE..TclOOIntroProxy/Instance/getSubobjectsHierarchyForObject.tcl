IDE::TclOOIntroProxy instproc getSubobjectsHierarchyForObject object {
    set hlist [list $object]
    foreach sobject [lsort [namespace children [info object namespace $object]]] {
	 if {[info object isa object $sobject]} {
             lappend hlist [my getSubobjectsHierarchyForObject $sobject]
         }
    }
    return $hlist
}
