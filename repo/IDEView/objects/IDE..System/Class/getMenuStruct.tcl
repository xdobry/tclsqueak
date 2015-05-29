IDE::System proc getMenuStruct {} {
    set mobj [self]::ms
    if {[Object isobject $mobj]} {
        return $mobj
    }
    my getMenuStructForMaster [self]
}
