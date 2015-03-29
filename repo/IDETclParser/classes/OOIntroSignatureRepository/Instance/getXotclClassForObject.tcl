OOIntroSignatureRepository instproc getXotclClassForObject {object {namespace {}}} {
    #ttc vartype object xotcl
    if {[info object isa object $object]} {
        info object class $object
    } else {
        return
    }
}
