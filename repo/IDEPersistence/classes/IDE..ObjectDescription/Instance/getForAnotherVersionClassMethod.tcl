IDE::ObjectDescription instproc getForAnotherVersionClassMethod {name id} {
    return [my handleMethodChange [my getClassMethodObjName $name] IDE::ClassMethodDescription $id]
}
