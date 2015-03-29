IDE::XOIntroProxy proc getIntroProxies {} {
    list [IDE::XOIntroProxy getIntroProxy] [IDE::TclOOIntroProxy getIntroProxy]
}
