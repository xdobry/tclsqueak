IDE::VariableTraceList instproc dispatchParentWithSelected procName {
    set actual [my selectedItemFirst]
    if {$actual ne ""} {
        [my varsTracker] $procName $actual
    } else {
        my upsMessage {you need to select a item for this action}
    }
}
