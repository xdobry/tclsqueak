IDE::ListView instproc dispatchWithSelected procName {
    set actual [my selectedItemFirst]
    if {$actual ne ""} {
        my $procName $actual
    } else {
        my upsMessage {you need to select a item for this action}
    }
}
