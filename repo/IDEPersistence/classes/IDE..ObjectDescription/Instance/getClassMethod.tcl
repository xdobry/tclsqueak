IDE::ObjectDescription instproc getClassMethod name {
    set obj [my getClassMethodObjName $name]
    if {[Object isobject $obj]} {
        return  $obj
    } else {
        return  [IDE::ClassMethodDescription create $obj]
    }
}
