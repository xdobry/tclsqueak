IDE::XOIntroProxy proc getIntroProxyForObject obj {
    if {[Object isobject $obj]} {
        return [IDE::XOIntroProxy getIntroProxy]
    } elseif {[info object isa object $obj]} {
        return [IDE::TclOOIntroProxy getIntroProxy]
    }
    return
}
