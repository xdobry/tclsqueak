IDE::ObjectDescription proc createForObject object {
    if {[Object isobject ${object}::description]} {
        return ${object}::description
    }
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $object]
    if {[set desc [$introProxy getDescriptionForObject $object]] ne ""} {
        return $desc
    }
    if {$introProxy eq ""} {
        error "can not find proxy for object $object"
    }
    if {[$introProxy isObjectClass $object]} {
        set class IDE::ClassDescription
    } else {
        set class IDE::ObjectDescription
    }
    if {[$introProxy getOOSystemName] ne "XOTcl"} {
        set desc [$class new]
        $desc mixin add IDE::NoXOTclObjectMixin
    } else {
        set desc [$class create [$object]::description]
    }
    $desc setupForObject $object $introProxy
    return $desc
}
