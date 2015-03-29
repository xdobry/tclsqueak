IDE::ClassDescription instproc registerInstanceMethod name {
    set mobj [my getInstanceMethodObjName $name]
    if {[Object isobject $mobj]} {
        $mobj updateVersion
    } else {
        [my getInstanceMethod $name] insertVersion
    }
    return $mobj
}
