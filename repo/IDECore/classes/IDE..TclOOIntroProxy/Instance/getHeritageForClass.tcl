IDE::TclOOIntroProxy instproc getHeritageForClass class {
    set hlist $class
    foreach sclass [info class superclasses $class] {
	if {$sclass eq "::oo::object"} continue
	lappend hlist [my getHeritageForClass $sclass]
    }
    return $hlist
}
