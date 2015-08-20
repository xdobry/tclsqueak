IDE::System proc invokeProc {object proc {proxy {}}} {
    if {$proxy eq ""} {
        set proxy [IDE::XOIntroProxy getIntroProxyForObject $object]
    }
    if {$proxy eq "" || ![$proxy isObject $object]} return   
    my invokeProcWithArg $object $proc {*}[$proxy getMethodParamDescForObject $object $proc]
}
