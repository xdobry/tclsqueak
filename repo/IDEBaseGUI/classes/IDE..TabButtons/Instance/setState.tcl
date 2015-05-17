IDE::TabButtons instproc setState newState {
    my instvar state
    if {$state ne ""} {
        [my winNameFromState $state] state !active
    }
    set state $newState
    if {$newState ne ""} {
        [my winNameFromState $state] state active
    }
}
