IDE::TclOOIntroProxy instproc getParentForObject object {
    if {![namespace exists $object]} {
        return
    }
    set nsparent [namespace parent $object]
    if {[info object isa object $nsparent]} {
        return $nsparent
    }
    return
}
