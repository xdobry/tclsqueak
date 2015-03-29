IDE::ListView instproc dispatchWithSelectedAll procName {
    set actual [my selectedItems]
    if {$actual ne ""} {
        my $procName $actual
    } else {
        my upsMessage {you need to select a item for this action}
    }
}
