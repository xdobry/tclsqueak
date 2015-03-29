IDE::XOIntroProxy proc getIntroProxyForMethodType vtype {
    switch $vtype {
        Procs -
        Class -
        Instance {
            return [IDE::XOIntroProxy getIntroProxy]
        }
        OOClass -
        OOObject -
        OOInstance {
            return [IDE::TclOOIntroProxy getIntroProxy]
        }
    }
}
