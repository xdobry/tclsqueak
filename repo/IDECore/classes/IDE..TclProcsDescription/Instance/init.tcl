IDE::TclProcsDescription instproc init {} {
    [self class] registerMethod [my name] [self]
    my instvar introProxy
    set introProxy [IDE::XOIntroProxy getIntroProxy]
}
