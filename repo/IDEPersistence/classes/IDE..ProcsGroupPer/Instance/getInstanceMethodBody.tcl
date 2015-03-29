IDE::ProcsGroupPer instproc getInstanceMethodBody method {
    # needed for changes browser
    [IDE::XOIntroProxy getIntroProxy] getProcBody $method
}
