IDE::System proc resetMenuStruct {} {
    set mobj [self]::ms
    if {[Object isobject $mobj]} {
        $mobj destroy
        my getMenuStruct
    }
}
