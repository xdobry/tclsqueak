IDE::CodeController instproc canModifyComponent cobj {
    if {[$cobj isPersistent] && ![$cobj questForChange]} {
        return 0
    } else {
        return 1
    }
}
