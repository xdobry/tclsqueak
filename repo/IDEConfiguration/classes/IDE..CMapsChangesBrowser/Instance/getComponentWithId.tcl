IDE::CMapsChangesBrowser instproc getComponentWithId id {
    my instvar compeditionArr
    if {[info exists compeditionArr($id)]} {
        set inst $compeditionArr($id)
    } else {
        set inst [IDE::ComponentEdition new -childof [self] $id]
        set compeditionArr($id) $inst
    }
    return $inst
}
