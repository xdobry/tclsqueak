IDE::ClassDescription instproc registerDefMethod {{name __defbody}} {
    set mobj [my getInstanceMethodObjName $name]
    if {[Object isobject $mobj]} {
        $mobj updateVersion
    } else {
        [my getDefMethod $name] insertVersion
    }
    return $mobj
}
