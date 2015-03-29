IDE::ObjectDescription instproc registerClassMethod name {
    set mobj [my getClassMethodObjName $name]
    if {[Object isobject $mobj]} {
        $mobj updateVersion
    } else {
        [IDE::ClassMethodDescription create $mobj] insertVersion
    }
    return $mobj
}
