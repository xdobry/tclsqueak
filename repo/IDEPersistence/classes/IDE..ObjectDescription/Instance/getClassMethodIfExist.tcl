IDE::ObjectDescription instproc getClassMethodIfExist name {
    set obj [my getClassMethodObjName $name]
    if {[Object isobject $obj]} {
        return  $obj
    } else {
        return
    }
}
