IDE::MethodEdit instproc setBodyTextControler {tvclass tvtype tmethod controler} {
    my set vclass $tvclass
    my set vctype $tvtype
    my set method $tmethod
    set ret {}
    if {$tvtype eq "Procs"} {
        if {[Object isobject $tvclass]} {
            set pobj [$tvclass getProcObjForNameIfExist $tmethod]
            if {$pobj ne ""} {
                set ret [$pobj getBody]
            }
        }
    } else {
        set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $tvtype]
        set rtype [IDE::XOIntroProxy getAbstractMethodType $tvtype]
        set ret [$introProxy getBody${rtype}MethodIfExist $tvclass $tmethod]
    }
    if {$ret eq ""} {
        my setTextControler "# Method $tmethod in $tvclass was probably deleted from the System" $controler
    }
    my setTextControler $ret $controler xotcl
}
