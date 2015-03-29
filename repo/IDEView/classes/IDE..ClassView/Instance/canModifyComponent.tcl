IDE::ClassView instproc canModifyComponent {} {
    my instvar cobj
    if {[$cobj isPersistent] && ![$cobj questForChange]} {
        return 0
    } else {
        return 1
    }
}
