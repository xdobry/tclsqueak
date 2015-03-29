IDE::ComponentPersistence instproc loadObject objectid {
    set object [IDE::ObjectDescription loadObject $objectid [self]]
    if {[$object istype IDE::ObjectDescription]} {
        my basicAddObject [$object getObjectName]
        # not very sauber
        set introProxy [my getIntroProxy]
        $introProxy setMetadataForObject [$object getObject] component [my getName]
    }
    return $object
}
