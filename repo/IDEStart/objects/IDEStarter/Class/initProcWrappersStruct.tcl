IDEStarter proc initProcWrappersStruct {} {
    my instvar tclmethodArr
    if {[array exists tclmethodArr]} {
        IDE::ProcsGroup buildStuctFromArray tclmethodArr
        unset tclmethodArr
    }
}
