IDE::MethodViewDB instproc dispatchWithMethodDescriptor procName {
    my instvar vclass vtype
    set actual [my selectedItemFirst]
    if {$actual eq ""} return
    set introProxy [my getIntroProxy]
    if {[set desc [$introProxy getDescriptionForObject $vclass]] eq ""} return
    if {![$desc isPersistent]} return
    if {[$desc istype IDE::ProcsGroup]} {
        set methodDesc [$desc getProcObjForNameIfExist $actual]
    } else {
        set methodDesc [$desc get${vtype}Method $actual]
    }
    my $procName $methodDesc
}
