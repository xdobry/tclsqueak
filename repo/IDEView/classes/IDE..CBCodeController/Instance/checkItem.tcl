IDE::CBCodeController instproc checkItem hitem {
    lassign $hitem vclass vtype method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vtype]
    switch [IDE::XOIntroProxy getAbstractMethodType $vtype] {
        Component {
            if {[IDE::Component getCompObjectForNameIfExist $vclass] ne ""} {
                return 1            
            }
        }
        Def {
            if {[$introProxy isObject $vclass]} {
                return 1
            }
        }
        ProcsGroup {
            if {[Object isobject $vclass]} {
                return 1
            }
        }
        Class {
            if {$method in [$introProxy getClassMethods $vclass]} {
                return 1
            }
        }
        Instance  {
            if {$method in [$introProxy getInstanceMethods $vclass]} {
                return 1
            }
        }
        Procs {
            if {[info procs ::$method] ne ""} {return 1}
        }
    }
    return 0
}
