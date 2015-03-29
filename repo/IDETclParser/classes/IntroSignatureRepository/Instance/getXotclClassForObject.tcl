IntroSignatureRepository instproc getXotclClassForObject {object {namespace {}}} {
    #ttc vartype object xotcl
    if {[Object isobject $object]} {
        $object info class
    } else {
        return
    }
}
