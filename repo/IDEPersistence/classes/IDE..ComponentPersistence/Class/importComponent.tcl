IDE::ComponentPersistence proc importComponent comp {
    set cobj [IDE::Component getCompObjectForNameIfExist $comp]
    if {$cobj eq ""} {
        error "no component with name $comp"
    }
    $cobj mixin add IDE::ComponentPersistence
    $cobj initForPersistence
    $cobj updateInsert
    $cobj importAllObjects
    $cobj updateRequired
}
