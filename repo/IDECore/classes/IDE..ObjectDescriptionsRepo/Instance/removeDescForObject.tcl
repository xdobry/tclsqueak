IDE::ObjectDescriptionsRepo instproc removeDescForObject object {
    my instvar descMap
    set object [my normalizeName $object]
    if {![catch {set descMap($object)} desc]} {
        $desc destroy
        unset descMap($object)
    }
}
