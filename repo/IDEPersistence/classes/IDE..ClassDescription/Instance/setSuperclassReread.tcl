IDE::ClassDescription instproc setSuperclassReread superclass {
    set introProxy [my getCompIntroProxy]
    set object [my getObject]
    set currentSuperClasses [$introProxy getSuperclassForClass $object]
    if {[llength $currentSuperClasses]==1 && [$introProxy isRootClass [lindex $currentSuperClasses 0]] && [llength $superclass]==0} return
    if {$currentSuperClasses ne $superclass} {
        if {[llength $superclass]==0} {
            lappend superclass [$introProxy getRootClass]
        }
        $introProxy setSuperclassForClass $object $superclass
    }
}
