IDE::ClassDescription instproc getForAnotherVersionInstanceMethod {name id} {
    return [[self] handleMethodChange [my getInstanceMethodObjName $name] IDE::InstanceMethodDescription $id]
}
