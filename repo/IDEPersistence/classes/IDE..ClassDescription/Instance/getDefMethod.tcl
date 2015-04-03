IDE::ClassDescription instproc getDefMethod {{name __defbody}} {
    set obj [my getInstanceMethodObjName __defbody]
    if {[Object isobject $obj]} {
        return  $obj
    } else {
        return  [IDE::DefVersionDescription create $obj]
    }
}
