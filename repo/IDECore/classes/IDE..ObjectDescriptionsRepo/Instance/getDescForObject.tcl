IDE::ObjectDescriptionsRepo instproc getDescForObject object {
    my instvar descMap
    set object [my normalizeName $object]
    if {[catch {set descMap($object)} desc]} {
        return
    } else {
        return $desc
    }
}
