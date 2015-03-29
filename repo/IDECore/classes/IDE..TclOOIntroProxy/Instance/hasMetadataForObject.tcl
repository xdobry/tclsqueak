IDE::TclOOIntroProxy instproc hasMetadataForObject {object key} {
    my instvar idemeta
    set object [IDE::XOIntroProxy normalizeName $object]
    if {![catch {set objdic $idemeta($object)}]} {
        return [dict exists $objdic $key]
    }
    return 0
}
