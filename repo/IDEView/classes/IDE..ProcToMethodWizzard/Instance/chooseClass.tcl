IDE::ProcToMethodWizzard instproc chooseClass {} {
    my instvar win targetClass
    set targetClass [IDE::ClassSelector getClass]
    $win.tframe.target configure -text $targetClass
}
