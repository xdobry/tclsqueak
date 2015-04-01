IDE::ClassDescription instproc getForAnotherVersionDefMethod {name id} {
    [self] handleMethodChange [my getInstanceMethodObjName __defbody] IDE::InstanceMethodDescription $id
}
