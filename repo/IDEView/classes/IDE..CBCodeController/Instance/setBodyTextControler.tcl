IDE::CBCodeController instproc setBodyTextControler args {
    [my getMethodedit] setBodyTextControler {*}$args
    my setStateSaveButton 0
}
