IDE::TclOOIntroProxy instproc getHeritageFlatForClass class {
    # this function return another order then info heritage
    # first base classe and it is no reverse of ingo heritage
    set hlist [info class superclasses $class]
    foreach sclass $hlist {
	set hlist [concat [my getHeritageFlatForClass $sclass] $hlist]
    }
    return $hlist
}
