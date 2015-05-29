IDE::TclOOIntroProxy instproc getDescriptionForObject object {
    my instvar descRepo
    if {[Object isobject $object] && [$object istype IDE::ProcsGroup]} {
        return [$object getDescription]
    }
    $descRepo getDescForObject $object
}
