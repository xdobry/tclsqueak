IDE::XOIntroProxy instproc getObjectNamespace object {
    set ns [namespace qualifiers $object]
    if {$ns eq ""} {
        return
    }
    if {[string range $ns 0 1] ne "::"} {
        set ns ::$ns
    }
    if {$ns eq "" || $ns eq "::" || ![namespace exists $ns]} {
        return
    }
    if {![my isObject $ns]} {
        return $ns
    }
    return
}
