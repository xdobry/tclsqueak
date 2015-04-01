IDE::ClassDescription instproc getDefMethod {{name __defbody}} {
    set obj [my getInstanceMethodObjName $name]
    if {[Object isobject $obj]} {
        return  $obj
    } else {
        return  [IDE::DefVersionDescription create $obj]
    }
}
