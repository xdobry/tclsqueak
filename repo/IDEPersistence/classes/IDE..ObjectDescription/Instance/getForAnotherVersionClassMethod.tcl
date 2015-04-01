IDE::ObjectDescription instproc getForAnotherVersionClassMethod {name id} {
    my handleMethodChange [my getClassMethodObjName $name] IDE::ClassMethodDescription $id
}
