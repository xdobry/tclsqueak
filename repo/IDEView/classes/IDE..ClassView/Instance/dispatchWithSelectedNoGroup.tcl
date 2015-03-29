IDE::ClassView instproc dispatchWithSelectedNoGroup procName {
    set actual [my selectedItem]
    if {$actual ne ""} {
        if {[my set vtype] ne "Procs"} {
            my $procName $actual
        } else {
            my upsMessage {you can not do this action on Tcl procs-group}
        }
    } else {
        my upsMessage {you need to select a item for this action}
    }
}
