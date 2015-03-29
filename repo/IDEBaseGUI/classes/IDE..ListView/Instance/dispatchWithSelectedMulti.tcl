IDE::ListView instproc dispatchWithSelectedMulti procName {
    set actual [my selectedItems]
    if {$actual ne ""} {
        foreach item $actual {
            my $procName $item
        }
    } else {
        my upsMessage {you need to select a item for this action}
    }
}
