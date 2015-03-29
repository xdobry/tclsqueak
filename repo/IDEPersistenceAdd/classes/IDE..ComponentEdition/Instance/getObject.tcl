IDE::ComponentEdition instproc getObject name {
    my instvar objectArr
    if {[info exists objectArr($name)]} {
        return $objectArr($name)
    } else {
        return {}
    }
}
