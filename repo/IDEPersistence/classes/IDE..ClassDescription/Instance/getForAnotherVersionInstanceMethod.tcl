IDE::ClassDescription instproc getForAnotherVersionInstanceMethod {name id} {
    [self] handleMethodChange [my getInstanceMethodObjName $name] IDE::InstanceMethodDescription $id
}
