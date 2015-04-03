IDE::ClassViewDB instproc dispatchWithSelectedClassCheck procName {
    my instvar vclass
    set actual [my selectedItem]
    set introProxy [my getIntroProxy]
    if {$actual ne "" && [set desc [$introProxy getDescriptionForObject $vclass]] ne "" &&
    [$desc isPersistent] && [$introProxy isObjectClass $vclass]} {
        my $procName $desc
    } else {
        my upsMessage {Select one class in version control for this action}
    }
}
