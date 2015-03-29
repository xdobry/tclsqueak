IDE::CompView instproc getIntroProxy {} {
    my instvar vcomponent
    if {$vcomponent ne ""} {
        set cobj [IDE::Component getCompObjectForNameIfExist $vcomponent]
        if {$cobj ne ""} {
            return [$cobj getIntroProxy]
        }
    }
    return
}
