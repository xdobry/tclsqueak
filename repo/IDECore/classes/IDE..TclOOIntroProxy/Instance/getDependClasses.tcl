IDE::TclOOIntroProxy instproc getDependClasses class {
    set dep [info class subclasses $class]
    foreach sobject [lsort [namespace children [info object namespace $class]]] {
	 if {[info object isa object $sobject] && [info object isa class $sobject]} {
             lappend dep $sobject [my getSubobjectsHierarchyForObject $sobject]
         }
    }
    return $dep
}
