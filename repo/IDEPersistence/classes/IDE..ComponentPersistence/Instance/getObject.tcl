IDE::ComponentPersistence instproc getObject name {
    # !!! Check if the name is class/object in component
    if {[Object isobject $name]} {
        return [$name getDescription]
    } else {
        return [my getProcsGroupWithName $name]
    }
}
