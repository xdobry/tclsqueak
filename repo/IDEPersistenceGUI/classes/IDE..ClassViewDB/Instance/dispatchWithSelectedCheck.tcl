IDE::ClassViewDB instproc dispatchWithSelectedCheck procName {
    my instvar vclass
    set actual [my selectedItem]
    set introProxy [my getIntroProxy]
    if {$actual ne "" && [set desc [$introProxy getDescriptionForObject $vclass]] ne "" &&
    [$desc isPersistent]} {
        my $procName $desc
    } else {
        my upsMessage {Select one class/proc group in version control for this action}
    }
}
