IDE::SyntaxChecker instproc getBodyForItem item {
    lassign [IDE::XOIntroProxy getDescFromDisplayItem $item] vclass vtype vmethod
    set rtype [IDE::XOIntroProxy getAbstractMethodType $vtype]
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vtype]
    if {$vtype eq "Procs"} {
         return [$introProxy getProcBody $vmethod]
    } else {
         return [$introProxy getBody${rtype}MethodIfExist $vclass $vmethod]
    }
}
