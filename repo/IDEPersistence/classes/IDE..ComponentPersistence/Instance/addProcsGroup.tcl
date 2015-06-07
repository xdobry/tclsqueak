IDE::ComponentPersistence instproc addProcsGroup obj {
    next
    my instvar componentid
    if {![$obj isPersistent]} {
        IDE::ProcsGroupPer installObject $obj
    }
    my installObject $obj
}
