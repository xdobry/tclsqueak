IDE::ArrayBrowser instproc inspectAsObject key {
    my instvar varray
    set obj [my varAction set ${varray}($key)]
    if {[Object isobject $obj]} {
        $obj inspect
    } else {
        IDE::Dialog error "$obj in not XOTclIDE object"
    }
}
