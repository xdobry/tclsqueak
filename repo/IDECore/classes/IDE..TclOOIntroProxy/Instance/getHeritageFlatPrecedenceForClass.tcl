IDE::TclOOIntroProxy instproc getHeritageFlatPrecedenceForClass class {
    # this function return another order then info heritage
    # first base classe and it is no reverse of ingo heritage
    set hlist [info class superclasses $class]
    foreach sclass $hlist {
	lappend hlist {*}[my getHeritageFlatPrecedenceForClass $sclass]
    }
    return $hlist
}
