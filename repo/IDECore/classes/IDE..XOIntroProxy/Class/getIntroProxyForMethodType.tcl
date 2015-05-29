IDE::XOIntroProxy proc getIntroProxyForMethodType vtype {
    switch $vtype {
        Def -
        ProcsGroup -
        Procs -
        Class -
        Instance {
            return [IDE::XOIntroProxy getIntroProxy]
        }
        OODef -
        OOProcsGroup -
        OOProcs -
        OOClass -
        OOObject -
        OOInstance {
            return [IDE::TclOOIntroProxy getIntroProxy]
        }
    }
}
