IDE::ArrayBrowser instproc inspectAsObject key {
    set obj [my getKey $key]
    if {[Object isobject $obj]} {
        $obj inspect
    } else {
        IDE::Dialog error "$obj in not XOTcl object"
    }
}
