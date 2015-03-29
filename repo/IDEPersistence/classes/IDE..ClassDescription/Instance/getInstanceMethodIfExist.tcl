IDE::ClassDescription instproc getInstanceMethodIfExist name {
    set obj [my getInstanceMethodObjName $name]
    if {[Object isobject $obj]} {
        return  $obj
    } else {
        return
    }
}
