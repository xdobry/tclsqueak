IDE::TclOOIntroProxy instproc unloadObject object {
    my instvar descRepo idemeta
    # In TclOO destroing superclass will also destroy the class
    # so we need to check if the object is still existing
    if {[info object isa object $object]} {
        $object destroy
    }
    $descRepo removeDescForObject $object
    unset -nocomplain idemeta($object)
    IDE::CommentsContainer destroyObject $object
}
