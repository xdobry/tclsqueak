IDE::TclOOIntroProxy instproc getParentForObject object {
    set nsparent [namespace parent $object]
    if {[info object isa object $nsparent]} {
        return $nsparent
    }
    return
}
