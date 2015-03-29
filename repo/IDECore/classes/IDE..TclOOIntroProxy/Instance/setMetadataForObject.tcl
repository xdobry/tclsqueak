IDE::TclOOIntroProxy instproc setMetadataForObject {object key value} {
    my instvar idemeta
    set object [IDE::XOIntroProxy normalizeName $object]
    dict set idemeta($object) $key $value
}
