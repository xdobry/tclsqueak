IDE::MethodListViewDB instproc dispatchWithMethodDescriptor procName {
    my instvar vclass vtype method
    set actual $method
    if {$actual eq ""} return
    set introProxy [my getIntroProxy]
    set desc [$introProxy getDescriptionForObject $vclass]
    if {$desc eq ""} return
    if {![$desc isPersistent]} return
    if {[$desc istype IDE::ProcsGroup]} {
        set method_desc [$desc getProcObjForNameIfExist $actual]
    } else {
        set method_desc [$desc get${vtype}Method $actual]
    }
    my $procName $method_desc
}
