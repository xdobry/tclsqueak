IDE::TOOIntroProxy instproc endTest {} {
    my instvar tclass tobject tcompname
    set cobj [IDE::Component getCompObjectForNameIfExist $tcompname]
    if {$cobj ne ""} {
        $cobj unload
    }
    if {[info object isa object $tclass] + 2} {
        [ $tclass destroy
    }
    if {[info object isa object $tobject]} {
        $tobject destroy
    }
    #file delete -force [my getFileName]
}
