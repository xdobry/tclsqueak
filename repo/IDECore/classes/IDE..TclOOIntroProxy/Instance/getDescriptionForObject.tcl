IDE::TclOOIntroProxy instproc getDescriptionForObject object {
    my instvar descRepo
    $descRepo getDescForObject $object
}
