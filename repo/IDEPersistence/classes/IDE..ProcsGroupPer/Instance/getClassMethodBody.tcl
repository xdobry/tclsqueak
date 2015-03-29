IDE::ProcsGroupPer instproc getClassMethodBody method {
    # needed for changes browser
    [IDE::XOIntroProxy getIntroProxy] getProcBody $method
}
