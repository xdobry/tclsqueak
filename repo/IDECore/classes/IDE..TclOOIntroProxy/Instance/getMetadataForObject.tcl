IDE::TclOOIntroProxy instproc getMetadataForObject {object key} {
    my instvar idemeta
    set object [IDE::XOIntroProxy normalizeName $object]
    if {![catch {dict get $idemeta($object) $key} ret]} {
        return $ret
    }
    return
}
