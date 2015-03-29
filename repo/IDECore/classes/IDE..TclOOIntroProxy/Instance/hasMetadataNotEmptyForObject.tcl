IDE::TclOOIntroProxy instproc hasMetadataNotEmptyForObject {object key} {
    my instvar idemeta
    set object [IDE::XOIntroProxy normalizeName $object]
    if {![catch {set objdic $idemeta($object)}]} {
        return [expr {[dict exists $objdic $key] && [dict get $objdic $key] ne ""}]
    }
    return 0
}
