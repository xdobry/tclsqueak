IDE::System proc getRequiredComponentsForRek {component components rcomps} {
    if {$component in $rcomps} {
        return
    }
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj eq ""} {
        return
    }
    set reqcomps [list]
    foreach rcomp [$cobj getRequiredFrom] {
        if {$rcomp ni $components || $rcomp in $rcomps} {
            continue
        }
        lappend reqcomps {*}[my getRequiredComponentsForRek $rcomp $components $reqcomps]
    }
    concat $reqcomps $component
}
