IDE::XOIntroProxy instproc getDescriptionForObject object {
    if {[Object isobject $object] && [$object istype IDE::ProcsGroup]} {
        return [$object getDescription]
    } elseif {[Object isobject ${object}::description]} {
        return ${object}::description
    }
    return
}
