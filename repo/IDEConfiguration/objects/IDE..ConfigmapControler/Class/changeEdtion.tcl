IDE::ConfigmapControler proc changeEdtion {object type} {
    if {$type eq "components"} {
        my instvar componentArr
        set newobject [IDE::EditionChooser getVersion $componentArr([$object name]) $object]
    } else {
        my instvar configmapArr
        set newobject [IDE::EditionChooser getVersion $configmapArr([$object name]) $object]
    }
    my instvar view selectedVersion
    if {$newobject eq "" || $object==$newobject} return
    set list [${view}::${type} getObjectsList]
    set id [lsearch -exact $list $object]
    set list [lreplace $list $id $id $newobject]
    ${view}::${type} setObjectsList $list
    if {$type eq "components"} {
        ${selectedVersion}::components setList $list
    } else {
        ${selectedVersion}::childconigmaps setList $list
    }
}
