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
        OOClass -
        OOObject -
        OOInstance {
            return [IDE::TclOOIntroProxy getIntroProxy]
        }
    }
}
