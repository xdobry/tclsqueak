IDE::ObjectDescriptionsRepo instproc setDescForObject {object desc} {
    my instvar descMap
    set object [my normalizeName $object]
    if {[catch {set descMap($object)}]} {
        set descMap($object) $desc
    } else {
        error "desc for $object already exists."
    }
}
