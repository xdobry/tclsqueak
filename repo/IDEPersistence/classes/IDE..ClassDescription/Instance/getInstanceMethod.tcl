IDE::ClassDescription instproc getInstanceMethod name {
    set obj [my getInstanceMethodObjName $name]
    if {[Object isobject $obj]} {
        return  $obj
    } else {
        return  [IDE::InstanceMethodDescription create $obj]
    }
}
