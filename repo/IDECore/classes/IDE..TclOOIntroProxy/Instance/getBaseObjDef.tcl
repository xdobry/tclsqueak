IDE::TclOOIntroProxy instproc getBaseObjDef name {
    set cname [my stripNamespace [info object class $name]]
    return "$cname create [string trimleft $name :]"
}
